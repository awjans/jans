apt -y update
apt -y upgrade
apt -y install git
mkdir /src
git clone https://github.com/awjans/jans.git /src/jans
chmod ug+x /src/jans/awslightsail.cfg.sh /src/jans/refresh.sh
/src/jans/awslightsail.cfg.sh
