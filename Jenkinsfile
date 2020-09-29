pipeline {

    agent {
        node {
            label 'master'
        }
    }
    environment { 
        PATH = "/root/apictl:$PATH"
    }
    options {
        buildDiscarder logRotator( 
                    daysToKeepStr: '16', 
                    numToKeepStr: '10'
            )
    }

    stages {

        stage('Setup Environment for APICTL') {
            steps {
                sh """#!/bin/bash
                ENVCOUNT=\$(apictl list envs --format {{.}} | wc -l)
                if [ "\$ENVCOUNT" == "0" ]; then
                    apictl add-env -e dev --apim https://dev.mycorp.com:9443
                fi
                """
            }
        }

        stage('Deploy APIs To "Dev" Environment') {
            steps {
                sh """
                apictl login dev -u admin -p admin -k
                apictl vcs deploy -e dev
                """
            }
        }

        stage('Run Tests in "Dev" Environment') {
            steps {
                sh """#!/bin/bash
                pwd
                
                bash tests/test.sh
                """
            }
        }
    }   
}