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
                          sleep 30 
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
                     sleep 40
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
		 
    stage('Infrastructure Scan') {
       steps {
                         sh '''#!/bin/bash
                     sleep 40
                     echo "Security Scan Completed"  '''
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
                     sleep 55
                     echo "Install Kubernetes"  '''
      }
    }

      stage('Install KubeAdm') {
      steps {
       sh '''#!/bin/bash
                     sleep 40
                     echo "Install KubeAdm"  '''

      }
    }
    
     stage('Install Kubectl') {
      steps {
       sh '''#!/bin/bash
                     sleep 45
                     echo "Install Kubectl"  '''

      }
    }
   
     stage('Install Kubelet') {
      steps {
       sh '''#!/bin/bash
                     sleep 50
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
                     sleep 220
                     echo "Setup Helm Charts"  '''

      }
    }

   stage('Setup ELK') {
      steps {
       sh '''#!/bin/bash
                     sleep 230
                     echo "Setup ELK"  '''

      }
    }
    
   stage('Setup Vault ') {
      steps {
       sh '''#!/bin/bash
                     sleep 240
                     echo "Setup Vault"  '''

      }
    }
   }
 }
    stage('Deploy App Stack') {
      parallel {
        stage('Install Couchbase ') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/postgress-kube.yml')
          }
        }
        stage('Install Nginx') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/nginx-kube.yml')
          }
        }
        stage('Install RabbitMQ ') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/rabbitmq-kube.yml')
          }
        }
       }
      } 

        
         stage('Infrastructure Analyzer') {n
                    steps {
                     sh '''#!/bin/bash
                     sleep 30
                     echo "Infra test"  '''
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
            

             stage('Static Code Analysis') {
                steps {
                  sh '''#!/bin/bash
                     sleep 60
                     echo "Unit Test and Sonar  Code Coverage"  '''
                  }
                 }

            stage('Deploy App') {
                steps {
                  ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/iaacdemoapp.yml')
                }
               }
              }
            }  
            stage('Application Testing') {
               parallel {
                 stage('Integration Test') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 47
                     echo "Integration test"  '''
                  }
                }
            
            stage('Functional Test') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 54
                     echo "Integration test"  '''
                  }
                }
           
             stage('Regression test') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 39
                     echo "Integration test"  '''
                     }
                   }




                  }
                }
             
              stage('Security Scan') {
                 steps {
                   sh 'echo "docker.io/exampleuser/examplerepo:latest `pwd`/Dockerfile" > anchore_images'
                   anchore name: 'anchore_images'
                }
               }          

           
           
           stage('Smoke Test') {
                    steps {
                     sh '''#!/bin/bash
                     sleep 30
                     echo "Smoke Test Completed"  '''
                  }
               }
          }
        }


