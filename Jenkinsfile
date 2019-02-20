pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        echo 'Test pipeline'
      }
    }
  stage('Provision VM') {
      steps {
          dir("/root/infrastructure-as-code/terraform/noncontainerized_env/") 
          sh 'pwd'
          }
        }
   stage('Deleting VM ') {  
      steps {
          sh label: '', returnStdout: true, script: '''
			terraform destroy -auto-approve
 			terraform apply -auto-approve
						   '''

            }  
          }
  }
}

