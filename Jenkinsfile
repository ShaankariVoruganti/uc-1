pipeline {
    agent any
    environment {
      MY_CRED = credentials('AzureServicePrincipal')
  }


   stages {
       stage('git clone'){
      steps{
        sh 'git clone https://github.com/ShaankariVoruganti/uc-1'
      }
    }
    stage('build') {
      steps {
          sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET'
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
