node {
   try {
      stage('Checkout'){
         checkout scm
      }

      stage('Build image') {
         docker.build("link here:${env.BUILD_ID}")
      }

      stage("Start services") {
         sh "echo BUILD_ID=${env.BUILD_ID} > .env"
         sh "docker-compose up -d"
      }

      stage("Run tests") {
         def ip = "http://" + dock.host.ip('react-app') + ":3000"
         build job: 'name_of_job',
            parameters: [string(name: 'APP_URL', value: "${ip}")] 
      } catch (error){
         echo "${error}"
         currentBuild.result = 'FAILURE'
      } finally{
         stage (Stop services) {
            sh "docker-compose down"
         }
      }
   }