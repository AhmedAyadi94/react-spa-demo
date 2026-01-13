pipeline {
  agent any

  stages {

    stage('Checkout Code') {
      steps {
        git 'https://github.com/AhmedAyadi94/react-spa-demo.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t react-spa:ci .'
      }
    }

    stage('Run Container') {
      steps {
        sh '''
          docker stop react-spa-ci || true
          docker rm react-spa-ci || true
          docker run -d --name react-spa-ci -p 8082:80 react-spa:ci
        '''
      }
    }
  }
}
