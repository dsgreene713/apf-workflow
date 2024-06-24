# resource "aws_cloudwatch_event_rule" "new_account" {
#   name        = "new-account-rule"
#   description = "Rule to capture new AWS account creation events"
#
#   event_pattern = jsonencode({
#     "detail-type" : ["AWS Service Event via CloudTrail"],
#     "source" : ["aws.organizations"],
#     "detail" : {
#       "eventName" : ["CreateAccountResult"]
#     }
#   })
# }
#
# resource "aws_cloudwatch_event_target" "new_acct_sns" {
#   rule      = aws_cloudwatch_event_rule.new_account.name
#   target_id = "new-account-sns-notification"
#   arn       = aws_sns_topic.new_account.arn
# }
#
# resource "aws_sns_topic" "new_account" {
#   name = "new-account-creation-notification"
# }
#
# resource "aws_sns_topic_policy" "new_acct" {
#   arn    = aws_sns_topic.new_account.arn
#   policy = data.aws_iam_policy_document.sns_topic_policy.json
# }
#
# data "aws_iam_policy_document" "sns_topic_policy" {
#   statement {
#     effect  = "Allow"
#     actions = ["SNS:Publish"]
#
#     principals {
#       type        = "Service"
#       identifiers = ["events.amazonaws.com"]
#     }
#
#     resources = [aws_sns_topic.new_account.arn]
#   }
# }