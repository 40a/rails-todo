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
    sh "curl -fsSL ${jenkinsScriptRepo}/build.sh | sh"
}

stage 'Test'
node {
    sh "curl -fsSL ${jenkinsScriptRepo}/setup_test.sh | sh"
    sh "curl -fsSL ${jenkinsScriptRepo}/test.sh | sh"
}

stage 'Staging Deploy'
node {
    sh "curl -fsSL ${jenkinsScriptRepo}/deploy.sh | sh"
}

stage 'QA'
node {
    input 'Is succeeded system test?'
}

stage 'Release Judgement'
node {
    input 'OK?'
}

stage 'Production Deploy'
node {
    sh "curl -fsSL ${jenkinsScriptRepo}/deploy.sh | sh"
}
