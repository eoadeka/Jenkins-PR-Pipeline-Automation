pipeline {

  agent any

  stages {
    // Build Stage
    stage("build") {
      
      steps {
        // Build the application
        script {
            bat 'echo "Building the application..."'
            bat 'docker build -t ellaadeka/github-pr-deploy .'
        }
      }
    }
    
    // Test Stage
    stage("test") {
      
      steps {
        // Run automated tests
        script {
          bat 'echo "Running tests..."'
          bat 'python -m pytest'
        }
      }
    }
    
    // Deploy Stage
    stage("deploy") {
      
      steps {
        // Deploy application
        script {
          bat 'echo "Deploying the application..."'
          withCredentials([string(credentialsId: 'dockerhubsecrets', variable: 'dockerhubpwd')]) {
            // log in to Docker hub
            bat "docker login -u ellaadeka -p ${dockerhubpwd}"
          }
          // Push image to dockerhub
          bat 'docker push ellaadeka/github-pr-deploy'
        }
      }
    }
  }

  post {
    always {
      // Cleanup actions
      echo 'Always executing cleanup...'
    }
    
    success{
      // Actions to be performed on successful execution
      echo 'Pipeline succeeded!'
    }
    
    failure{
      // Actions to be performed on pipeline failure
      echo 'Pipeline failed. Please review the build logs and fix the issues.'
    }
  }
}
