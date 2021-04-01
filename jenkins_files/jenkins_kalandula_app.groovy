node("linux1"){
        stage("Checkout  Kalandula Repo") {
            git branch: 'main', changelog: false, credentialsId: '94326', poll: false, url: 'https://github.com/MaximMandelblum/kandula_assignment.git'
    }
        stage('Building docker image') {
            customImage = docker.build("6037159/jenkins-test:latest")
           
        }
        
        stage('Run docker for test') {
            container = customImage.run('-p 5000:5000')
        }
        
        stage('Scan') {
            echo "Scanning image $customImage.id"
            sh "trivy image --timeout 5m --exit-code=0 --severity CRITICAL,HIGH  $customImage.id"
            sh "trivy image --timeout 5m --exit-code=0 --severity UNKNOWN,LOW,MEDIUM --ignore-unfixed $customImage.id"
            
        }
        
        stage('Test Docker Image ') {
             
             sh 'sleep 10'
             response = sh (script: 'curl -Is localhost:5000 | head -1 | awk \'{print $2}\'', returnStdout: true).trim()
             if ("$response" == "200"){
                 echo "the resonse is ${response}"
                 withDockerRegistry(credentialsId: 'dockerhub.max') {
                      customImage.push()
                      customImage.push("${BUILD_NUMBER}")
            }
        }
        else{
                 container.stop()
                 error("application didnt reutrn 200,  $response")
        }
    }
        stage('Clean Local Docker'){
            container.stop()
         }
    
        stage("Get the App Yaml file ") {
            git 'https://github.com/MaximMandelblum/project_deployment_ops.git'
        }
          
        // stage('Deploy pod'){
            
        //     kubernetesDeploy configs: 'kalandula_app.yaml,kalandula_lb.yaml', kubeConfig: [path: ''], kubeconfigId: 'kube', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
    
        // }
            stage('Install Cosnul on Kubernetes') {
            withCredentials([kubeconfigFile(credentialsId: 'kube', variable: 'KUBECONFIG')]) {
            
            sh """
            export KUBECONFIG=\${KUBECONFIG}
            kubectl apply -f kalandula_app.yaml
            kubectl apply -f kalandula_lb.yaml
            """
    }
           
        
}
        
    }