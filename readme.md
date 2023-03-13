# Module Terraform "windows-webapp"

Ce module Terraform permet de créer une application web Windows Azure.

## Exemples d'utilisation

```hcl
module "windows-webapp" {
  source        = "billal-lab/windows-webapp/azure"
  location      = "francecentral"
  client_name   = "client1"
  environnement = "dev"
  create_rg     = true
  app_settings  = {
    "SOME_KEY" = "SOME_VALUE"
  }
  sku_name      = "F1"
}
```
## Variables d'entrée

Les variables d'entrée suivantes sont disponibles pour ce module :

### Requis

- `location` : L'emplacement où l'application web sera déployée.
- `client_name` : Le nom du client.
- `environnement` : L'environnement de déploiement.

### Facultatif

- `create_rg` : Indique si le module doit créer un groupe de ressources. (par défaut: `true`)
- `app_settings` : Les paramètres de l'application web. (par défaut: `{}`)
- `sku_name` : Le SKU de l'application web. (par défaut: `"F1"`)

## Outputs

Les sorties suivantes sont disponibles pour ce module :

- `webapp_name` : Le nom de l'application web.
- `resource_group_name` : Le nom du groupe de ressources.

## Exécution

Pour exécuter ce module, exécutez les commandes suivantes :

```bash
terraform init
terraform plan
terraform apply

## Auteurs

Ce module Terraform a été créé par [votre nom ou celui de votre entreprise ici].

## License

Ce module est sous licence [choisissez une licence open source ici, par exemple MIT]. Voir `LICENSE` pour plus d'informations.
