# Google Cloud Platform (GCP) MemoryStore (Redis) Terraform Module
Terraform module to create a Cloud MemoryStore for Redis instance on Google Cloud Platform (GCP).

Cloud Memorystore for Redis is a fully managed Redis service for the Google Cloud Platform. Applications running on Google Cloud Platform can achieve extreme performance by leveraging the highly scalable, available, secure Redis service without the burden of managing complex Redis deployments.

See [Cloud Memorystore for Redis Documentation](https://cloud.google.com/memorystore/docs/redis/)

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
