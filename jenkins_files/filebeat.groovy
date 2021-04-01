node("linux1"){
     
        stage("Get the filebeat Yaml file ") {
            git 'https://github.com/MaximMandelblum/project_deployment_ops.git'
        }
          
        stage('Deploy pod'){
            
            kubernetesDeploy configs: 'filebeat.yaml', kubeConfig: [path: ''], kubeconfigId: 'kube', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
    
        }
        
    }