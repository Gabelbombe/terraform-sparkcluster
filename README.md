# Project Overview

The goal of this project is to deploy a Spark cluster on AWS using Packer, Terraform, Consul, and Atlas.

# Atlas Deployment Steps

Run the commands below from the `spark` directory.

### Packer

```
packer push packer/spark-consul.json
```

```
packer push packer/spark-master.json
```

```
packer push packer/spark-slave.json
```

