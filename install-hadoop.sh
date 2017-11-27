#!/bin/bash

ansible-playbook -i inventories/hadoop-single hadoop-single.yaml

# ansible-playbook -i inventories/hadoop hadoop-cluster.yaml