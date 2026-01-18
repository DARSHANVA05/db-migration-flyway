pipeline {
  
    agent { label 'flyway' }

    environment {
        FLYWAY_HOME = "/opt/flyway"  
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
                    def confFile = "conf/flyway-dev.conf"  

                    withCredentials([usernamePassword(credentialsId: 'flyway-mysql', usernameVariable: 'DB_USER', passwordVariable: 'DB_PASS')]) {
                        sh """
                        $FLYWAY_HOME/flyway -configFiles=${confFile} -user=$DB_USER -password=$DB_PASS migrate
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
