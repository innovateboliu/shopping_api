set -v
export HOME=/root

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get install -yq git esl-erlang elixir nodejs

yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# Talk to the metadata server to get the project id
PROJECTID=$(curl -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")

git config --global credential.helper gcloud.sh
git clone https://source.developers.google.com/p/$PROJECTID /opt/app

cd /opt/app
yes | mix deps.get
yes | npm install
node node_modules/brunch/bin/brunch build

mix phoenix.server
