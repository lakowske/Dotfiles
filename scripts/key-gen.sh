#!/bin/bash

ssh-keygen -t rsa -f `uuid`.rsa -P ""
ssh-copy-id seth@50.105.209.222

