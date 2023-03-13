variable "location" {
    type        = string
    description = "The location/region where the resource group will be created."
    default     = "francecentral"
    validation {
        # valide si la valeur est dans la liste
        condition     = contains(["francecentral", "westeurope", "northeurope"], var.location)
        error_message = "The location must be either francecentral, westeurope or northeurope."
    }
}

variable "sku_name" {
    type = string
    description = "The SKU name of the web app."
    default = "S1"
    validation {
        # valide si la valeur est dans la liste B1, B2, B3, D1, F1, FREE, I1, I1v2, I2, I2v2, I3, I3v2, I4v2, I5v2, I6v2, P0V3, P1MV3, P1V2, P1V3, P2MV3, P2V2, P2V3, P3MV3, P3V2, P3V3, P4MV3, P5MV3, S1, S2, S3, SHARED, WS1, WS2, WS3
        condition     = contains(["B1", "B2", "B3", "D1", "F1", "FREE", "I1", "I1v2", "I2", "I2v2", "I3", "I3v2", "I4v2", "I5v2", "I6v2", "P0V3", "P1MV3", "P1V2", "P1V3", "P2MV3", "P2V2", "P2V3", "P3MV3", "P3V2", "P3V3", "P4MV3", "P5MV3", "S1", "S2", "S3", "SHARED", "WS1", "WS2", "WS3"], var.sku_name)
        error_message = "The SKU name must be either B1, B2, B3, D1, F1, FREE, I1, I1v2, I2, I2v2, I3, I3v2, I4v2, I5v2, I6v2, P0V3, P1MV3, P1V2, P1V3, P2MV3, P2V2, P2V3, P3MV3, P3V2, P3V3, P4MV3, P5MV3, S1, S2, S3, SHARED, WS1, WS2, WS3."
    }
}

variable "app_settings" {
    type = map(string)
    description = "The app settings of the web app."
    default = {
        
    }
}

variable "client_name" {
  type = string
  description = "The name of the client."
}

variable "environnement" {
  type = string
  description = "The environnement"
  validation {
    condition = contains(["dev", "rec", "qua", "prod"], var.environnement)
    error_message = "The environnement must be either dev, rec, qua or prod."
  }
}

variable "create_rg" {
    type = bool
    description = "Create resource group"
    default = true
}