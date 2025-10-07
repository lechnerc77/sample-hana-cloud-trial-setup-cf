# The necessary entitlements have been assigned on subaccount level namely:
# HANA tools (service: hana-cloud-tools-trial // Plan: tools) - application
# HANA cloud (service: hana-cloud-trial // Plan: hana)
# HDI container (service: hana // Plan: hdi-shared)
data "cloudfoundry_space" "space" {
  name = var.space_name
  org  = var.org_id
}

data "cloudfoundry_service_plan" "hana_cloud_trial__hana" {
  service_offering_name = "hana-cloud-trial"
  name                  = "hana"
}

resource "cloudfoundry_service_instance" "hana_cloud_trial__hana" {
  name         = "hana-cloud-trial-hana"
  type         = "managed"
  space        = data.cloudfoundry_space.space.id
  service_plan = data.cloudfoundry_service_plan.hana_cloud_trial__hana.id
  parameters = jsonencode(
    {
      "data" : {
        "memory" : 16,
        "vcpus" : 1,
        "generateSystemPassord" : false,
        "edition" : "cloud",
        "systempassword" : "${var.hana_cloud_system_password}",
        "enabledservcies" : {
          "docstore" : false
          "dpserver" : false
          "scriptserver" : false
        },
        "whitelistIPs" : ["0.0.0.0/0"] # Allow all IPs - use with caution in production
      }
  })

  timeouts = {
    create = "45m"
    update = "45m"
    delete = "45m"
  }
}

data "cloudfoundry_service_plan" "hana__hdi_shared" {
  service_offering_name = "hana"
  name                  = "hdi-shared"
}

resource "cloudfoundry_service_instance" "hana__hdi_shared" {
  name         = "hana-hdi-shared"
  type         = "managed"
  space        = data.cloudfoundry_space.space.id
  service_plan = data.cloudfoundry_service_plan.hana__hdi_shared.id

  depends_on = [cloudfoundry_service_instance.hana_cloud_trial__hana]
}

resource "btp_subaccount_subscription" "hana_cloud_tools" {
  depends_on = [ cloudfoundry_service_instance.hana_cloud_trial__hana ]

  subaccount_id = var.subaccount_id
  app_name      = "hana-cloud-tools-trial"
  plan_name     = "tools"
}

resource "btp_subaccount_role_collection_assignment" "hana_cloud_admin" {
  for_each   = toset(var.hana_cloud_admins)
  depends_on = [btp_subaccount_subscription.hana_cloud_tools]

  subaccount_id        = var.subaccount_id
  role_collection_name = "SAP HANA Cloud Administrator"
  user_name            = each.value
}
