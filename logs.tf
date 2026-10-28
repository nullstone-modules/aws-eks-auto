module "logs" {
  source  = "nullstone-modules/logs/aws"
  version = "~> 0.2.0"

  // See https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
  name              = "/aws/eks/${local.resource_name}/cluster"
  tags              = local.tags
  retention_in_days = var.log_retention_in_days
  kms_key_arn       = aws_kms_key.this.arn
}
