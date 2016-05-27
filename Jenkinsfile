#!groovy

def jenkinsScriptRepo = 'https://raw.githubusercontent.com/wiro34/jenkins-script/master/ruby_on_rails'

stage 'Setup'
node {
    checkout scm
    env.REMOTE_USER = 'ec2-user'
    env.REMOTE_HOST = '52.40.57.77'
    env.SSH_KEY = 'jenkins-nodes.pem'
    sh "curl ${jenkinsScriptRepo}/bootstrap.sh | sh"
}

stage 'Build'
node {
    sh "curl ${jenkinsScriptRepo}/build.sh | sh"
}

stage 'Test'
node {
    sh "curl ${jenkinsScriptRepo}/setup_test.sh | sh"
    sh "curl ${jenkinsScriptRepo}/test.sh | sh"
}

stage 'Deploy'
node {
    sh "curl ${jenkinsScriptRepo}/deploy.sh | sh"
}

stage 'QA'
node {
    input 'Is succeeded system test?'
}
