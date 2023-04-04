variable "location" {
  type        = string
  description = "Localizacao do RG"
  default     = "westus"
}


variable "tags_var" {
  type        = map(any)
  description = "tags de recursos"
  default = {

    Ambiente = "Homolog"


  }
}

variable "address_space" {
  type        = list(any)
  description = "Endereço da Vnet"
  default = [
    "10.0.0.0/16",
    "192.168.0.0/24",
    "192.168.20.0/24"
  ]
}