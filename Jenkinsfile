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

      
      steps {
       sh 'terraform apply -auto-approve'
       }


}
  }
}

