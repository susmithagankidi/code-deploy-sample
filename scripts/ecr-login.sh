$(aws ecr get-login --region us-east-1 --no-include-email)
if [  -z "$(docker ps -a -q)"  ]; then
echo "no containers to remove"
else
echo "Stopping and removing Containers"
docker stop $(docker ps -q)
docker rm -vf $(docker ps -a -q)
fi
docker pull 272842187865.dkr.ecr.us-east-1.amazonaws.com/nginx:latesttest
docker images
docker run -d -p 5000:5000 --restart always 272842187865.dkr.ecr.us-east-1.amazonaws.com/nginx:latesttest
docker container ls
