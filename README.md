# Google Cloud Platform (GCP) MemoryStore (Redis) Terraform Module
Terraform module to create a MemoryStore instance on Google Cloud Platform (GCP).

## Usage

```ruby
module "redis" {
    source       = "git@github.com:tsadoklf/terraform-google-memorystore-redis.git?ref=master"
    name         = "my-redis"
    display_name = "My Redis instance - created by Terraform module"
    
    region       = "europe-west1"
    zone         = "europe-west1-b"
    alt_zone     = "europe-west1-c"
}
```
