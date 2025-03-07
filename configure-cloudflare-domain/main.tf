resource "cloudflare_record" "a-record" {
    zone_id = var.cloudflare_zone_id
    name = "verturus.com"
    content = var.ipv4_address
    type = "A"
    ttl = 1
    proxied = true
}


resource "cloudflare_record" "aaaa-record" {
    zone_id = var.cloudflare_zone_id
    name = "verturus.com"
    content = var.ipv6_address
    type = "AAAA"
    ttl = 1
    proxied = true
}

resource "cloudflare_record" "cname-record" {
    zone_id = var.cloudflare_zone_id
    name = "www"
    content = "verturus.com"
    type = "CNAME"
    ttl = 1
    proxied = true
}

resource "cloudflare_record" "ns1-record" {
    zone_id = var.cloudflare_zone_id
    name = "verturus.com"
    content = "ns1.digitalocean.com"
    type = "NS"
    ttl = 1
    proxied = false
}

resource "cloudflare_record" "ns2-record" {
    zone_id = var.cloudflare_zone_id
    name = "verturus.com"
    content = "ns2.digitalocean.com"
    type = "NS"
    ttl = 1
    proxied = false
}

resource "cloudflare_record" "ns3-record" {
    zone_id = var.cloudflare_zone_id
    name = "verturus.com"
    content = "ns3.digitalocean.com"
    type = "NS"
    ttl = 1
    proxied = false
}

resource "cloudflare_ruleset" "country_block_waf" {
    zone_id     = var.cloudflare_zone_id
    name        = "Block Countries WAF"
    description = "Block Trafic from specific countries"
    kind        = "zone"
    phase       = "http_request_firewall_custom"

    rules {
        action      = "block"
        expression  = "(ip.geoip.country eq \"CN\" or ip.geoip.country eq \"RU\" or ip.geoip.country eq \"KP\" or ip.geoip.country eq \"IR\")"
        description = "Block China, Russia, North Korea, and Iran"
        enabled     = true
    }
}
