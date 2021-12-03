node {
    stage('git clone') {
        git branch: 'hometask-3',
            url: 'https://github.com/Evgeny11111/devops/'
            
    }
    stage('build') {
        sh 'mvn -f pom.xml clean verify'
    }
    stage('test') {
        sh 'mvn -f pom.xml test'
    }
    stage('sonar_qube') {
        def scannerHome = tool 'MySonar';
        withSonarQubeEnv('MySonar') {
            sh "${scannerHome}/bin/sonar-scanner \
            -Dsonar.projectKey=pipeline \
            -Dsonar.sources=src/main \
            -Dsonar.tests=src/test \
            -Dsonar.java.binaries=target/classes \
            -Dsonar.junit.reportPaths=target/surefire-reports \
            -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml"
        }
    }
    stage('allure') {
    stage('allure') {
        allure([results: [[path: 'allure']]])

    }
    }
    stage('deploy') {
        withCredentials([file(credentialsId: 'evgeny_ansible_pass', variable: 'VAULT_PASSWORD')]) {
            sh 'ansible-playbook deploy/playbook.yml --vault-password-file $VAULT_PASSWORD -i deploy/servers.hosts'
        }
    }
}
