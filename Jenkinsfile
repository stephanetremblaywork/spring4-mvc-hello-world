pipeline {
    agent any

    tools {
        maven 'maven 3.8.5'
        jdk 'jdk8'
    }

    stages {
        stage('Build') {
            steps {
				configFileProvider(
				[configFile(fileId: 'Maven_Settings_XML', variable: 'MAVEN_SETTINGS')]) {
						sh 'mvn -s "$MAVEN_SETTINGS" compile'
				}
            }
        }
        stage('Test') {
            steps {
				configFileProvider(
				[configFile(fileId: 'Maven_Settings_XML', variable: 'MAVEN_SETTINGS')]) {
						sh 'mvn -s "$MAVEN_SETTINGS" test'
				}
            }
        }
        stage('Deploy') {
            steps {
				configFileProvider(
				[configFile(fileId: 'Maven_Settings_XML', variable: 'MAVEN_SETTINGS')]) {
						sh 'mvn -s "$MAVEN_SETTINGS" deploy'
				}
            }
        }
    }
}
