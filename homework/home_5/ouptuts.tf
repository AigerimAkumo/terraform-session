# output "alb_dns_name" {
#   description = "ALB DNS name"
#   value       = aws_lb.app_alb.dns_name
# }



// session-6
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "certificate_arn" {
  value = aws_acm_certificate.cert.arn
}
