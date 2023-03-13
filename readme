Terraform module to create az web app on windows os

```hcl
module "win-webapp" {
    source   = "./modules/terraform-azure-windows-webapp"
    location = "francecentral"
    client_name = "client1"
    environnement = "dev"
    create_rg = true
    app_settings = {
        "SOME_KEY" = "SOME_VALUE"
    }
    sku_name = "F1"
}

output "name" {
    description = "The url of the webapp"
    value = module.win-webapp.webapp_url
}
```