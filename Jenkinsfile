#!groovy

stage 'Build'
node {
    checkout scm
    sh '/opt/jenkins-script/ruby_on_rails/bootstrap.sh'
    sh '/opt/jenkins-script/ruby_on_rails/build.sh'
}

stage 'Test'
node {
    checkout scm
    sh '/opt/jenkins-script/ruby_on_rails/bootstrap.sh'
    sh '/opt/jenkins-script/ruby_on_rails/test.sh'
}

stage 'Deploy'
node {
    sh '/opt/jenkins-script/ruby_on_rails/deploy.sh'
}

stage 'QA'
node {
    input 'Is succeeded system test?'
}
