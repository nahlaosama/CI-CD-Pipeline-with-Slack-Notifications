pipeline {
  agent any
   stage('SCM Checkout') {
      steps {
        echo '>>> Start getting SCM code'
        git 'https://github.com/khalednoh/demo1.git'
        echo '>>> End getting SCM code'
      }
    }
  stage('Build JAR') {
      steps {
        echo '>>> Start building using Maven'
        sh 'mvn -Dmaven.test.skip=TRUE install'
        echo '>>> End building using Maven'
      }
    }
