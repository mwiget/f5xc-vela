resource "volterra_origin_pool" "backend" {
  depends_on = [null_resource.next]
  name                   = format("%s-backend", var.project_prefix)
  namespace              = var.f5xc_namespace
  endpoint_selection     = "DISTRIBUTED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  port                   = 80
  no_tls                 = true

  dynamic "origin_servers" {
    for_each = {for workload in module.wl-us-east-1 : workload.instance.tags.Name => workload}
    content {
      private_ip {
        ip = origin_servers.value.instance.private_ip
        outside_network = false
        inside_network = true
        site_locator {
          site {
            name = format("%s-tgw2", var.project_prefix)
            namespace = "system"
          }
        }
      }
    }
  }

  healthcheck {
    name = volterra_healthcheck.hc.name
  }
}

resource "volterra_http_loadbalancer" "backend" {
  depends_on = [null_resource.next]
  name                            = format("%s-backend", var.project_prefix)
  namespace                       = var.f5xc_namespace
  no_challenge                    = true
  domains                         = [ "backend" ]
  labels                          = {
    "ves.io/app_type" = format("%s-arcadia", var.project_prefix)
  }
  disable_rate_limit              = true
  service_policies_from_namespace = true
  disable_waf                     = true
  source_ip_stickiness            = true

  advertise_custom {
    advertise_where {
      port = 80
      site {
        ip = "10.10.10.10"
        network = "SITE_NETWORK_INSIDE"
        site {
          name      = format("%s-tgw1", var.project_prefix)
          namespace = "system"
        }
      }
    }
    advertise_where {
      port = 80
      site {
        ip = "10.10.10.10"
        network = "SITE_NETWORK_INSIDE"
        site {
          name      = format("%s-vnet1", var.project_prefix)
          namespace = "system"
        }
      }
    }
  }

  default_route_pools {
    pool {
      name = volterra_origin_pool.backend.name
    }
    weight = 1
    priority = 1
  }

  http {
    dns_volterra_managed = false
    port = 80
  }
}

