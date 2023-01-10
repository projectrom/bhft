#/bin/bash

cd ./5_install
ansible-playbook -vv playbook.yml
echo `pwd`