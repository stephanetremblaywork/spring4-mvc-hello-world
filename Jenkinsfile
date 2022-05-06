pipeline {
    agent any

    tools {
        maven 'maven 3.8.5'
        jdk 'jdk8'
    }

    stages {
        stage('Build') {
            steps {
		withMaven(maven: 'maven 3.8.5', mavenSettingsConfig: 'Maven_Settings_XML'){
		    sh 'mvn compile'
		}
            }
        }
        stage('Test') {
            steps {
		withMaven(maven: 'maven 3.8.5', mavenSettingsConfig: 'Maven_Settings_XML'){
		    sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
		withMaven(maven: 'maven 3.8.5', mavenSettingsConfig: 'Maven_Settings_XML'){
		    sh 'mvn deploy'
            }
        }
    }
}
