variable "name" {
    type         = "string"
    description  = "The ID of the instance or a fully qualified identifier for the instance."
}
variable "display_name" {
    type         = "string"
    description  = "An arbitrary and optional user-provided name for the instance."
    default      = ""
}
variable "redis_version" {
    type         = "string"
    description  = "he version of Redis software. Updating the version will perform an upgrade/downgrade to the new version. Currently, the supported values are REDIS_3_2 for Redis 3.2."
    default      = "REDIS_3_2"
}
variable "tier" {
    type         = "string"
    description  = "The service tier of the instance: 'BASIC' - standalone instance, 'STANDARD_HA' - highly available primary/replica instances"
    default      = "BASIC"
}
variable "memory_size_gb" {
    type         = "string"
    description  = "Redis memory size in GiB"
    default      = "1"
}
variable "network" {
    type         = "string"
    description  = "The full name of the Google Compute Engine network to which the instance is connected."
    default      = "default"
}
variable "region" {
    type         = "string"
    description  = "The name of the Redis region of the instance."
}
variable "zone" {
    type         = "string"
    description  = "The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId]."
    default      = ""
}
variable "alt_zone" {
    type         = "string"
    description  = "Only applicable to STANDARD_HA tier which protects the instance against zonal failures by provisioning it across two zones. If provided, it must be a different zone from the one provided in [locationId]."
    default      = ""
}









