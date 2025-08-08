pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Choose Terraform action to perform'
        )
    }

    environment {
        TF_DIR = "Day4-statefile"
    }

    # stages {
    #     stage('git clone') {
    #         steps {
    #             git branch: 'main', url: 'https://github.com/saikrishnakolakanda/TerraformRepo.git'
    #         }
    #     }

        stage('terraform init') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('terraform plan') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform plan'
                }
            }
        }

        stage('terraform action') {
            steps {
                dir("${TF_DIR}") {
                    sh "terraform ${params.ACTION} -auto-approve"
                }
            }
        }
    }
}
