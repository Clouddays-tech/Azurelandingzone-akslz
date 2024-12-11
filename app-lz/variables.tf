# variable "spn-client-id" {
#   type = string
# }

# variable "spn-client-secret" {
#   type = string
# }

# variable "spn-tenant-id" {
#   type = string
# }

# variable "subscription_id" {
#   type = string
# }

variable "enable_telemetry" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "kubernetes_cluster_name" {
  type        = string
  default     = "myAks"
  description = "The name of the Kubernetes cluster."
}


# ##This is for Without AZs at West US
# variable "enable_telemetry" {
#   type        = bool
#   default     = true
#   description = <<DESCRIPTION
# This variable controls whether or not telemetry is enabled for the module.
# For more information see <https://aka.ms/avm/telemetryinfo>.
# If it is set to false, then no telemetry will be collected.
# DESCRIPTION
# }

