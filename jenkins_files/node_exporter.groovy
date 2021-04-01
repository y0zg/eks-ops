node("linux1"){
        stage("Checkout  Kalandula Repo") {
            
            git 'https://github.com/MaximMandelblum/project_deployment_ops.git'
    }
        stage('Deploy node exporter on k8s') {
            withCredentials([kubeconfigFile(credentialsId: 'kube', variable: 'KUBECONFIG')]) {
            sh """
            export KUBECONFIG=\${KUBECONFIG}
            helm install my-release bitnami/node-exporter 
            """
    }
           
        }
        
}