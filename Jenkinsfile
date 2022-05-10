pipeline {
	environment {
		docker_image_tag = 'stephanetremblay/spring4-mvc-hello-world'
		docker_image = ''
	}

	agent any

    tools {
        maven 'Maven 3.8.5'
        jdk 'jdk8'
    }

    stages {
        stage('Build') {
			steps {
				withMaven(
					maven: 'Maven 3.8.5',
					mavenLocalRepo: '.repository',
					mavenSettingsConfig: 'Maven_Settings_XML')
				{
						sh 'mvn compile'
				}
			}
        }
        stage('Test') {
			steps {
				withMaven(
					maven: 'Maven 3.8.5',
					mavenLocalRepo: '.repository',
					mavenSettingsConfig: 'Maven_Settings_XML')
				{
						sh 'mvn test'
				}
			}
        }
		stage('Docker Build') {
			steps {
				script {
					docker.withRegistry('https://hub.docker.com/repository/docker/stephanetremblay/spring4-mvc-hello-world', 'DockerHub') {
						docker_image = docker.build(docker_image_tage)
					}
				}
			}
		}
        stage('Deploy') {
			steps {
				withMaven(
					maven: 'Maven 3.8.5',
					mavenLocalRepo: '.repository',
					mavenSettingsConfig: 'Maven_Settings_XML')
				{
					sh 'mvn deploy'
				}
				script {
					docker.withRegistry('https://hub.docker.com/repository/docker/stephanetremblay/spring4-mvc-hello-world', 'DockerHub') {
						docker_image.push()
					}
				}
			}
		}
    }
}
