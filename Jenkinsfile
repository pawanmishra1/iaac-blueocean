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
          dir("/root/infrastructure-as-code/terraform/noncontainerized_env/"){ 
          
          }
           sh """#!/bin/bash
                   /usr/local/bin/terraform destroy -auto-approve
                   /usr/local/bin/terraform apply -auto-approve"""
                                                   
        
}
  }
}
}
