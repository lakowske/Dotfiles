#!/bin/bash

if [ $# -eq 0 ]
then
    git commit -am "auto-commit all"
else
    git commit -am "$1"
fi

git push
java -jar /Users/home/eclipse/McCluster/target/McCluster-0.0.1-SNAPSHOT.jar

