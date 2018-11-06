#
# https://www.terraform.io/docs/providers/google/r/redis_instance.html
#
resource "google_redis_instance" "redis" {
    depends_on              = ["google_compute_network.network"]

    name                    = "${var.env_name}-redis"
    display_name            = "${var.env_name}-redis: created by Terraform"

    # tier
    #
    # The service tier of the instance. Must be one of these values:
    #   BASIC:          standalone instance
    #   STANDARD_HA:    highly available primary/replica instances
    #
    tier                    = "STANDARD_HA"
    memory_size_gb          = 1

    authorized_network      = "${google_compute_network.network.self_link}"

    region                  = "${var.region}"
    location_id             = "europe-west1-b"
    alternative_location_id = "europe-west1-c"

    redis_version           = "REDIS_3_2"
    # reserved_ip_range     = "192.168.0.0/29"

}


