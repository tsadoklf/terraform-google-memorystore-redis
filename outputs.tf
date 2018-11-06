output "host" {
    description = "Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service."
    value       = "${google_redis_instance.redis.host}"
}
output "port" {
    description = "The port number of the exposed Redis endpoint."
    value       = "${google_redis_instance.redis.port}"
}
output "current_zone" {
    description = "he current zone where the Redis endpoint is placed. For Basic Tier instances, this will always be the same as the [zone] provided at creation time. For Standard Tier instances, this can be either [zone] or [alt_zone] and can change after a failover event."
    value       = "${google_redis_instance.redis.current_location_id}"
}
