pipeline {
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
        stage('Deploy') {
			steps {
				withMaven(
					maven: 'Maven 3.8.5',
					mavenLocalRepo: '.repository',
					mavenSettingsConfig: 'Maven_Settings_XML')
				{
					sh 'mvn deploy'
				}
			}
		}
    }
}
