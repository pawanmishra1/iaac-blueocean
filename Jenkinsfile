pipeline {
  agent any
    stages {
    stages('Provisioning') {
       stage('Cleanup VM') {
          steps {
                sh """#!/bin/bash
                      cd '/root/infrastructure-as-code/terraform/small-size/'
                          /usr/local/bin/terraform destroy -auto-approve
                           echo 'All VM deleted' """
               }
             }

     stage('Create VM') {
         steps {
            sh """#!/bin/bash
            cd '/root/infrastructure-as-code/terraform/small-size/'
                /usr/local/bin/terraform apply -auto-approve
                echo 'ALL VM Created'  """
            }
          }

      stage('Provision') {
        steps {
                  echo 'Completed'
            }
          }

     stage('Add User') {
        steps {
                  ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/user_add.yml'
            }
           }   

    stages('Install Container') {
       stage('Install Docker') {
              steps {
             ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/docker.yml'
            }
           }

    stage ('Install Kubernetes') {
        steps('Install Kubernetes') {
              ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml'
            }
          }



    stages('Provision Cluster') {
       stage('Create Cluster') {
              steps {
                     sh """#!/bin/bash
                     sleep 120
                     echo "Cluster Initialized"  """

            }
          }



    stage('Deploy App Stack') {
      parallel {
        stage('couchbase ') {
          steps {
             ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/postgress-kube.yml'
            }
           }

        stage('Nginx') {
          steps {
             ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/nginx-kube.yml'
            }
           }

        stage('RabbitMQ ') {
          steps {
             ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/rabbitmq-kube.yml'
            }
           }
         stage('Deply App ') {
            steps {
               ansiblePlaybook inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/iaacdemoapp.yml'
              }
            }
          }
        }
      }
    }
  }
 }
}  

