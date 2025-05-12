resource "aws_sqs_queue" "for_each_queue" {
    for_each = toset( local.queue_names )
    name = each.key
}

# variable "for_each_names" {
#     type = map
#     description = "a map of sqs names"
#     default = {
#         first = "first-for-each-sqs"
#         second = "second-for-each-sqs"
#         thirs = "third-for-each-sqs"
#     }
# }

//  FOR EXPRESSION
locals{
    queue_names = [ for i in range(1, 3): "queue-${i}"]
}

// for_each meta argument works with both A MAP and A LIST