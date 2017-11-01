## spark-install
Install a spark cluster.

### Define inventory
Define nodes (refer to the format in inventories/_hosts.yml)
inventories/_hosts.yml
inventories/._hosts.yml (with higher priority)

Define groups
inventories/xxx(inventory name)/_groups.yml

### Run Spark in standalone mode
Run on a single node (Master + Slave)
```sh
ansible-playbook -i inventories/standalone spark_standalone.yml
```
Run on cluster with N Nodes (1 Master + (N-1) Slaves)
```sh
ansible-playbook -i inventories/standalone_cluster spark_standalone.yml
```
Run on cluster with ha: N Nodes (x zookeepers + y Masters + z Slaves)
```sh
ansible-playbook -i inventories/standalone_ha spark_standalone.yml
```
### Run Spark on yarn
```sh
ansible-playbook -i inventories/on-yarn spark_yarn.yml
```
