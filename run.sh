#!/bin/bash
/etc/init.d/jenkins start
tail -f /var/log/jenkins/jenkins.log