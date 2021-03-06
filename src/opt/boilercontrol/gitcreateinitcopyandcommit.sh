#!/bin/bash

# Run like that:
# sudo ./gitcreateinitcopyandcommit.sh "<YOUR-COMMIT-COMMENT-HERE>"

if [ $# -eq 0 ]
  then
    echo "Usage: sudo ./gitcreateinitcopyandcommit.sh \"<YOUR-COMMIT-COMMENT-HERE>\""
  else
    mkdir /home/pi/git;
    cd /home/pi/git;
    rm -rf hestia-engine-dev;
    mkdir hestia-engine-dev;
    cd hestia-engine-dev;
    git init;
    git remote add origin https://github.com/gulliverrr/hestia-engine-dev.git;
    git pull origin master;
    sudo cp -r /opt/boilercontrol/* src/opt/boilercontrol/;
    sudo find . -name "*.class" -exec rm -rf {} \;
    sudo git add src;
    sudo git commit -m "$1";
    git push origin master;
fi
