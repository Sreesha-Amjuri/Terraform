
import groovy.json.JsonOutput
//git env vars
    env.git_url = 'https://github.com/Sreesha-Amjuri/Terraform.git'
    env.git_branch = 'master'
    env.credentials_id = 'GITHUB'

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
          git branch: "master" ,
           credentialsId: "$credentials_id" ,
          url: "https://github.com/Sreesha-Amjuri/Terraform.git"
          }
        }
 
      stage('init_and_plan') {
        steps {
          sh "sudo terraform init /var/lib/jenkins/workspace"
          sh "sudo terraform plan /var/lib/jenkins/workspace"
          }
      }

      stage('apply_changes') {
        steps {
          sh "sudo terraform apply /var/lib/jenkins/workspace --auto-approve"
          }
          }

  }
}
