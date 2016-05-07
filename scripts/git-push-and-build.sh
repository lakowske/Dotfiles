#!/bin/bash

git commit -am "$1"
git push
java -jar /Users/home/eclipse/McCluster/target/McCluster-0.0.1-SNAPSHOT.jar
