#Change the NAME variable with the name of your script
NAME=flood-events
LOG='udp://logs6.papertrailapp.com:37123'
docker build -t $NAME --build-arg NAME=$NAME .
docker run --log-driver=syslog --log-opt syslog-address=$LOG --log-opt tag=$NAME -v $(pwd)/data:/opt/$NAME/data --env-file .env --rm $NAME python main.py
