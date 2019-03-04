pipeline {
  agent any
  stages {
    stage('Provisioning') {
      parallel {
        stage('Provisioning') {
          steps('Delete VM ') {
            sh '''#!/bin/bash
                      cd \'/root/infrastructure-as-code/terraform/small-size/\'
                          /usr/local/bin/terraform destroy -auto-approve
                           echo \'All VM deleted\' '''
            
	
             sh '''#!/bin/bash
                 cd \'/root/infrastructure-as-code/terraform/small-size/\'
                /usr/local/bin/terraform apply -auto-approve
                echo \'ALL VM Created\'  '''
         
                 ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/user_add.yml')
                 }		  
                }


        stage('Clean VM ') {
          steps {
		         sh '''#!/bin/bash
                     sleep 60
                     echo "VM Deleted"  '''
            }
        }
        stage('Create VM') {
          steps {
		         sh '''#!/bin/bash
                     sleep 60
                     echo "VM Deleted"  '''
            }
        }   
        stage('User Add') {
		    steps {
            sh '''#!/bin/bash
                     sleep 60
                     echo "User Added"  '''
          }      
         }
		}
       }		
		 
    stage('Install Container') {
      parallel {
        stage(Install Docker') {
         steps {
           ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/docker.yml')
           ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml')
      }
    }
   
    stage('Install Kubernetes') {
      steps {
       sh '''#!/bin/bash
                     sleep 120
                     echo "Cluster Initialized"  '''

      }
    }
  }
}  
 
   stage('Provision Cluster') {
      parallel {
       steps {
        sh '''#!/bin/bash
                     sleep 120
                     echo "Cluster Initialized"  '''
      }
     
    stage('Setup Helm Charts') {
      steps {
       sh '''#!/bin/bash
                     sleep 120
                     echo "Setup Helm Charts"  '''

      }
    }

   stage('Setup ELK') {
      steps {
       sh '''#!/bin/bash
                     sleep 120
                     echo "Setup ELK"  '''

      }
    }
    
   stage('Setup Vault ') {
      steps {
       sh '''#!/bin/bash
                     sleep 120
                     echo "Setup Vault"  '''

      }
    }
   }
 }
    stage('Deploy App Stack') {
      parallel {
        stage('Couchbase ') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/postgress-kube.yml')
          }
        }
        stage('Nginx') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/nginx-kube.yml')
          }
        }
        stage('RabbitMQ ') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/rabbitmq-kube.yml')
          }
        }
       }
      } 


        stage('Application Deployment') {
          parallel {
              stage('SCM Checkout') {
                steps {
                  sh '''#!/bin/bash
                     sleep 20
                     echo "SCM Check OUT"  '''
               }
              }
              stage('Build App') {
                steps {
                  sh '''#!/bin/bash
                     sleep 20
                     echo "Build APP"  '''
                  }
                 }
            

             stage('Test') {
                steps {
                  sh '''#!/bin/bash
                     sleep 20
                     echo "Unit Test and Code Coverage"  '''
                  }
                 }

            stage('Build App') {
                steps {
                  ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/iaacdemoapp.yml')
          }
        }
           stage('Integration Test') {
                steps {
                  sh '''#!/bin/bash
                     sleep 20
                     echo "Deply  APP Successfully "  '''
                  }
                }
              }
            }   
          }
        }
      

