pipeline {
    agent { label 'flyway' }  

    environment {
        FLYWAY_HOME = "C:\\flyway-11.20.2"  
    }

    stages {

        stage('Checkout Flyway Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/DARSHANVA05/db-migration-flyway.git'
            }
        }

        stage('DB Migration') {
            steps {
                script {
                    def confFile = "conf\flyway.conf"

                    withCredentials([usernamePassword(credentialsId: 'flyway-mysql', usernameVariable: 'DB_USER', passwordVariable: 'DB_PASS')]) {
                        bat """
                        "%FLYWAY_HOME%\\flyway" -configFiles=${confFile} -user=%DB_USER% -password=%DB_PASS% migrate
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Flyway migration completed successfully for dev environment"
        }
        failure {
            error "Flyway migration failed for dev environment. Pipeline stopped!"
        }
    }
}

