// DOMAIN: danytulumidis
resource "aws_route53_zone" "danytulumidis" {
  name = "danytulumidis.com"
}

resource "aws_route53_record" "danytulumidis_cname" {
  zone_id = aws_route53_zone.danytulumidis.id
  name = "www.danytulumidis.com"
  type = "CNAME"
  ttl = "300"
  records = ["dextavision.github.io"]
}

resource "aws_route53_record" "danytulumidis_alias" {
  zone_id = aws_route53_zone.danytulumidis.id
  name = "danytulumidis.com"
  type = "A"
  ttl = "60"
  records = ["185.199.108.153","185.199.109.153","185.199.110.153","185.199.111.153"]
}

// DOMAIN: benaturely
resource "aws_route53_zone" "benaturely" {
  name = "benaturely.com"
}