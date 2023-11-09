pipeline {
    agent {
        docker {
            image 'node:20.9.0-alpine3.18'
            args '-p 3000:3000'
        }
        any
    }


    
    stages {
        stage('OWASP DependencyCheck') {
			steps {
				dependencyCheck additionalArguments: '--format HTML --format XML', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
			}
		}
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') { 
            steps {
                sh './jenkins/scripts/test.sh' 
            }
        }
    }
}



// pipeline {
//     agent any  // This specifies that the pipeline can run on any agent available with Docker installed
    
//     environment {
//         CI = 'true'
//     }
    
//     stages {
//         stage('Build Image') {
//             steps {
//                 script {
//                     // Print the current working directory to verify the path
//                     // echo "Current working directory: ${pwd()}"
                    
//                     // Build the Docker image from the Dockerfile in the current directory
//                     docker.build("secure-app", ".")
//                 }
//             }
//         }
//         stage('OWASP Dependency-Check Vulnerabilities') {
//             steps {
//                 // dependencyCheck additionalArguments: ''' 
//                 //             -o './'
//                 //             -s './'
//                 //             -f 'ALL' 
//                 //             --prettyPrint''', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
//                 dependencyCheck additionalArguments: '--format HTML --format XML', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
                
//                 dependencyCheckPublisher pattern: 'dependency-check-report.xml'
//             }
//         }
//         stage('Start Container') {
//             steps {
//                 // Run the Docker container
//                 sh "docker run --name secure-app -dp 127.0.0.1:3000:3000 secure-app"
//                 input message: 'Finished using the web site? (Click "Proceed" to continue)'

//                 // Clean up created images and app
//                 sh "docker stop secure-app"
//                 sh "docker rm secure-app"
//                 sh "docker image rm secure-app"
//             }
//         }
//         // stage('Headless Browser Test') {
//         //     agent {
//         //         docker {
//         //             image 'maven:3-alpine'
//         //             args '-v /root/.m2:/root/.m2'
//         //         }
//         //         steps {
//         //             sh 'mvn -B -DskipTests clean package'
//         //             sh 'mvn test'
//         //         }
//         //         post {
//         //             alwaus {
//         //                 junit 'target/surefile-reports/*.xml'
//         //             }
//         //         }
//         //     }
//         // }
//     }
// }
