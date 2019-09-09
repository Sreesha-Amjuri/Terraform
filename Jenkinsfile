
import groovy.json.JsonOutput
//git env vars
    env.git_url = 'https://github.com/Sreesha-Amjuri/Terraform.git'
    env.git_branch = 'master'
    env.credentials_id = '1'

//jenkins env vars
    env.jenkins_server_url = 'http://13.233.183.168:80'
    env.jenkins_node_custom_workspace_path = "/var/lib/jenkins/workspace"
    env.jenkins_node_label = 'master'
    env.terraform_version = '0.12.7'


pipeline {
  agent  any
    stages {
      stage('fetch_latest_code') {
        steps {
          git branch: "$git_branch" ,
          credentialsId: "$credentials_id" ,
          url: "$git_url"
          }
        }
      stage('install_deps') {
        steps {
          sh "sudo apt install wget zip python-pip -y"
          sh "cd /tmp"
          sh "curl -o terraform.zip https://releases.hashicorp.com/terraform/'$terraform_version'/terraform_'$terraform_version'_linux_amd64.zip"
          sh "unzip terraform.zip"
          sh "sudo mv terraform /usr/bin"
          sh "rm -rf terraform.zip"
        }
      }
      stage('init_and_plan') {
        steps {
          sh "sudo terraform init $jenkins_node_custom_workspace_path/workspace"
          sh "sudo terraform plan $jenkins_node_custom_workspace_path/workspace"
          }
      }

      stage('apply_changes') {
        steps {
          sh "echo 'yes' | sudo terraform apply $jenkins_node_custom_workspace_path/workspace" --auto-approve
          }
          }

  post {
    always {
      cleanWs()
      }
  }
  }
}
