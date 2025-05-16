
# resource "aws_route53_record" "cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#       name  = dvo.resource_record_name
#       type  = dvo.resource_record_type
#       value = dvo.resource_record_value
#     }
#   }

#   zone_id = var.route53_zone_id
#   name    = each.value.name
#   type    = each.value.type
#   ttl     = 60
#   records = [each.value.value]
# }

# resource "aws_route53_record" "alb_alias" {
#   zone_id = var.route53_zone_id
#   name    = var.domain_name
#   type    = "A"

#   alias {
#     name                   = aws_lb.app_alb.dns_name
#     zone_id                = aws_lb.app_alb.zone_id
#     evaluate_target_health = true
#   }
# }
