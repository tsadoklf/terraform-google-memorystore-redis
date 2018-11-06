output "host" {
    value = "${google_redis_instance.redis.host}"
}
output "port" {
    value = "${google_redis_instance.redis.port}"
}
output "current_zone" {
    value = "${google_redis_instance.redis.current_location_id}"
}
