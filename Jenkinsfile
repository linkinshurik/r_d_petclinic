pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build') {
      steps { sh 'mvn clean package' }
    }

    stage('Docker Build') {
      steps { sh 'docker build -t spring-demo:$BUILD_NUMBER .' }
    }

    stage('Deploy') {
      steps {
        sh '''
          docker rm -f spring-demo || true
          docker run -d --name spring-demo -p 8080:8080 spring-demo:$BUILD_NUMBER
        '''
      }
    }
  }
}