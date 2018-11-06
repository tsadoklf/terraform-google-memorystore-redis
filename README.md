# Google Cloud Platform (GCP) MemoryStore (Redis) Terraform Module
Terraform module to create a Cloud MemoryStore for Redis instance on Google Cloud Platform (GCP).

Cloud Memorystore for Redis is a fully managed Redis service for the Google Cloud Platform. Applications running on Google Cloud Platform can achieve extreme performance by leveraging the highly scalable, available, secure Redis service without the burden of managing complex Redis deployments.

See [Cloud Memorystore for Redis Documentation](https://cloud.google.com/memorystore/docs/redis/).

## Usage

```ruby
module "redis" {
    source       = "git@github.com:tsadoklf/terraform-google-memorystore-redis.git?ref=master"
    name         = "my-redis"
    display_name = "My Redis instance - created by Terraform module"
    
    tier         = "STANDARD_HA"
    
    region       = "europe-west1"
    zone         = "europe-west1-b"
    alt_zone     = "europe-west1-c"
}
```

## Connecting to a Redis instance from a GKE cluster
Based on [Connecting to a Redis instance from a Google Kubernetes Engine cluster](https://cloud.google.com/memorystore/docs/redis/connect-redis-instance-gke).

```bash

export PROJECT_ID="my-project-id"

export CLUSTER_NAME="my-k8s-cluster"
export CLUSTER_ZONE="europe-west1-b"

export REDIS_INSTANCE_ID="my-redis" 
export REDIS_REGION="europe-west1"

export RESERVED_IP_RANGE=$(gcloud redis instances describe $REDIS_INSTANCE_ID --region=$REDIS_REGION \
        | grep reservedIpRange | awk '{print $2}')

# you can get the Redis host and port number from the Terraform module's outputs, 
# from the Cloud Console or by running the following `gcloud` commands

# export REDIS_HOST_IP="10.0.0.4"
# export REDIS_PORT="6379"

export REDIS_HOST_IP=$(gcloud redis instances describe $REDIS_INSTANCE_ID --region=$REDIS_REGION \
        | grep host | awk '{print $2}')

export REDIS_PORT=$(gcloud redis instances describe $REDIS_INSTANCE_ID --region=$REDIS_REGION \
        | grep port | awk '{print $2}')

# connecet to the GKE cluster
gcloud container clusters get-credentials $CLUSTER_NAME --zone $CLUSTER_ZONE --project $PROJECT_ID

# deploy k8s-custom iptables
git clone https://github.com/bowei/k8s-custom-iptables.git
cd k8s-custom-iptables/
TARGETS="RESERVED_IP_RANGE" ./install.sh

# Test the connection from the GKE cluster to the Redis instance
# by deploying BusyBox to the cluster and using it's shell and telnet to connect to the Redis instance 
kubectl run -i --tty busybox --image=busybox -- sh

# Telnet the Redis instance using the host ip and port number 
telnet $REDIS_HOST_IP $REDIS_PORT

# Ping Redis to get '+PONG' response
PING 
```
