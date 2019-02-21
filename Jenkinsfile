pipeline {
  agent any
  stages {
    stage('Start Build IAAC LAB') {
      steps {
        echo 'Gathering LAB Inforamtion '
      }
    }
  stage('Provisioning  VM,s') {
      steps {
            sh """#!/bin/bash
            cd '/root/infrastructure-as-code/terraform/noncontainerized_env/'
            /usr/local/bin/terraform destroy -auto-approve
			echo 'All VM deleted '
            /usr/local/bin/terraform apply -auto-approve
			echo "Six VM Created"  """
            }
          }
		  
  stage('Adding User,s ') {
      steps {	  
		  ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/user_add.yml'
            }
	  }

  stage('Installation of  Docker ') {
      steps {
          ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/docker.yml'
            }
           }

  stage('Install Kubernetes') {
      steps {
	      ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml'
            }
          } 

  stage('Setup  Kubernetes Cluster') {
      steps {
              ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml'
            }
          }
 

  stage('Setup Postgress DB cluster in Kubernetes') {
      steps {
          echo "DB Setup"
            }		  
           }
  stage('Install Nginx on Kubernetes') {
      steps {	
          echo 	 "nginx setup"
            }
           }			
  }
}

