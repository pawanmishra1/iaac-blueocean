pipeline {
  agent any
  stages {
    stage('Provisioning') {
      parallel {
        stage('Provisioning') {
          steps {
            sh '''#!/bin/bash
                      cd \'/root/infrastructure-as-code/terraform/small-size/\'
                          /usr/local/bin/terraform destroy -auto-approve
                           echo \'All VM deleted\' '''
          }
        }
        stage('Clean VM ') {
          steps {
            echo 'Clean Vm '
          }
        }
        stage('VM Creation ') {
          steps {
            echo 'Test '
          }
        }
      }
    }
    stage('Create VM') {
      steps {
        sh '''#!/bin/bash
            cd \'/root/infrastructure-as-code/terraform/small-size/\'
                /usr/local/bin/terraform apply -auto-approve
                echo \'ALL VM Created\'  '''
      }
    }
    stage('Provision') {
      steps {
        echo 'Completed'
      }
    }
    stage('Add User') {
      steps {
        ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/user_add.yml')
      }
    }
    stage('Install Container') {
      steps {
        ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/docker.yml')
      }
    }
    stage('Install Kubernetes') {
      steps {
        ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/kubernetes.yml')
      }
    }
    stage('Provision Cluster') {
      steps {
        sh '''#!/bin/bash
                     sleep 120
                     echo "Cluster Initialized"  '''
      }
    }
    stage('Deploy App Stack') {
      parallel {
        stage('couchbase ') {
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
        stage('Deply App ') {
          steps {
            ansiblePlaybook(inventory: '/root/IAAC/playbooks/inventory.ini', playbook: '/root/IAAC/playbooks/iaacdemoapp.yml')
          }
        }
      }
    }
  }
}