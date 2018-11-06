output "host" {
    value = "${google_redis_instance.redis.host}"
}
output "port" {
    value = "${google_redis_instance.redis.port}"
}
output "current_location_id" {
    value = "${google_redis_instance.redis.current_location_id}"
}
