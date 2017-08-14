## Travis gem
1. apt-get install gcc libffi-dev ruby ruby-dev
1. gem install travis --no-rdoc --no-ri
1. travis login --org
1. travis-encrypt ssh_key.priv -r sermons/repo --key $KEY --iv $IV
