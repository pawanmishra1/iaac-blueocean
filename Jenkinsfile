pipeline {
  agent any
  stages {
    stage('Start IAAC') {
      steps {
        echo 'Create VM'
      }
    }
  stage('Provision VM') {
      steps {
            sh """#!/bin/bash
            cd '/root/infrastructure-as-code/terraform/noncontainerized_env/'
            /usr/local/bin/terraform destroy -auto-approve
			echo 'All VM deleted '
            /usr/local/bin/terraform apply -auto-approve
			echo "Six VM Created"  """
            }
          }
		  
  stage('Adding Ansible User in VM') {
      steps {	  
		  ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/user_add.yml'
            }
	  }

   stage('Install Docker in  VM') {
      steps {
          ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/docker.yml.yml'
            }
           }

   stage('Setup Kubernetes Cluster') {
      steps {
	      ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml
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

