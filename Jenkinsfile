pipeline {
  agent any
  stages {
    stage('Provisioning') {
      parallel {
        stage('Create VM') {
          steps('Create VM ') {
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
        
              stage('User Add') {
		    steps {
            sh '''#!/bin/bash
                     sleep 220
                     echo "User Added"  '''
          }      
         }
        }
       }		
		 
    stage('Install Container Tools') {
      parallel {
        stage('Install Docker') {
         steps {
           ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/docker.yml')
           
      }
    }
   
    stage('Install Kubernetes') {
      steps {
       sh '''#!/bin/bash
                     sleep 110
                     echo "Cluster Initialized"  '''
      }
    }

      stage('Install KubeAdm') {
      steps {
       sh '''#!/bin/bash
                     sleep 80
                     echo "Install KubeAdm"  '''

      }
    }
    
     stage('Install Kubectl') {
      steps {
       sh '''#!/bin/bash
                     sleep 90
                     echo "Install Kubectl"  '''

      }
    }
   
     stage('Install Kuelet') {
      steps {
       sh '''#!/bin/bash
                     sleep 100
                     echo "Install Kubelet"  '''

      }
    }


 


     }
    }
  
 
 
   stage('Provision Cluster') {
      parallel {
       stage('Midsize Cluster') {
        steps {
         ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml')
      }
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
              stage('App Git Code Checkout') {
                steps {
                  sh '''#!/bin/bash
                     sleep 20
                     echo "SCM Check OUT"  '''
               }
              }
              stage('Build App') {
                steps {
                  sh '''#!/bin/bash
                     sleep 40
                     echo "Build APP"  '''
                  }
                 }
            

             stage('Unit Test') {
                steps {
                  sh '''#!/bin/bash
                     sleep 60
                     echo "Unit Test and Code Coverage"  '''
                  }
                 }

            stage('Deploy App') {
                steps {
                  ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/iaacdemoapp.yml')
                }
               }
              }
            }  
            stage('App & Infra testing') {
               parallel {
                 stage('Integration Test') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 60
                     echo "Integration test"  '''
                  }
                }
             stage('Infra Testing') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 70
                     echo "Infra test"  '''
                  }
                }


            
            stage('Functional Testing') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 70
                     echo "Integration test"  '''
                  }
                }
           
             stage('Regression testing') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 80
                     echo "Integration test"  '''
                  }
                }
              }
            }
          }
        }
      

