node("linux1"){
        stage("Checkout  Kalandula Repo") {
            
            git 'https://github.com/MaximMandelblum/project_deployment_ops.git'
    }
        stage('Install Cosnul on Kubernetes') {
            withCredentials([kubeconfigFile(credentialsId: 'kube', variable: 'KUBECONFIG')]) {
            sh """
            export KUBECONFIG=\${KUBECONFIG}
            helm install consul hashicorp/consul -f values.yaml 
            """
    }
           
        }
        