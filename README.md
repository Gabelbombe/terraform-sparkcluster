# Project Overview

The goal of this project is to deploy a Spark cluster on AWS using Packer, Terraform, Consul and Atlas.


# Atlas Deployment Steps

Run the commands below from the `top level` directory.


### Exports

```
export AWS_REGION='us-east-1'
```

```
export AWS_SOURCEAM='ami-xxxxxx'
```

```
export ATLAS_USERNAME='ehime'
```


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
