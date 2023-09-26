terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

variable "compartment_ocid" {}
variable "region" {}

provider "oci" {
  region = "${var.region}"
}

resource "oci_kms_vault" "R2C_vault" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = "Vault_R2C"
    vault_type = "DEFAULT"
}

resource "oci_kms_key" "R2C_key" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = "Key_R2C"
    key_shape {
        #Required
        algorithm = "AES"
        length = 32
    }
    management_endpoint = oci_kms_vault.R2C_vault.management_endpoint
    protection_mode = "SOFTWARE"
}

resource "oci_kms_encrypted_data" "Encrypted_data_R2C" {
    #Required
    crypto_endpoint = oci_kms_vault.R2C_vault.crypto_endpoint
    key_id = oci_kms_key.R2C_key.id
    plaintext = "aHR0cHM6Ly9naXRodWIuY29tL2pHYWxhbkRTL2hhY2thdGhvbi8K"
}

output "CipherText" {
    value =  <<EOT
Este es el texto cifrado:
${oci_kms_encrypted_data.Encrypted_data_R2C.ciphertext}
para obtener el texto plano solo necesitas el cloud Shell y el OCID de tu llave:
${oci_kms_key.R2C_key.id}

https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.33.0/oci_cli_docs/cmdref/kms/crypto/decrypt.html
Ten en cuenta que tu resultado es base64
EOT
}