pipeline {
  agent any
  stages {
    stage('Provision VM') {
      steps {
        sh '''cd /root/infrastructure-as-code/terraform/noncontainerized_env/

terraform -version'''
      }
    }
  }
  environment {
    DC = 'Dev'
  }
}