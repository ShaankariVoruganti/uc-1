pipeline {
    agent any

   stages {
       stage('checkout'){
      steps{
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ShaankariVoruganti/uc-1']])
      }
    }

        stage('Clear destination') {
       steps {
        sh 'rm -rf uc-1'
         }
       }
 
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
    stage('Clear Terraform Plugin Cache') {
       steps {
        sh 'rm -rf ~/.terraform.d/plugin-cache'
         }
       }
 
         stage('Terraform validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }
    
  
        
         stage('Terraform plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

    }
}
