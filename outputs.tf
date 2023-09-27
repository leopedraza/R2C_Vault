output "INSTRUCCIONES" {
    value =  <<EOT

************* INSTRUCCIONES **********************************
Este es el texto cifrado:

------------------------------------------------------
${oci_kms_encrypted_data.Encrypted_data_R2C.ciphertext}
-------------------------------------------------------

Para obtener el texto plano solo necesitas el cloud Shell, el OCID de tu llave y el endpoint.

Puedes consultar la informacion sobre el proceso comando de descifrado aqui: 

https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.33.0/oci_cli_docs/cmdref/kms/crypto/decrypt.html

Ten en cuenta que tu resultado es base64

**************************************************************
EOT
}

output "key-id" {
    value = oci_kms_key.R2C_key.id
}

output "endpoint" {
    value = oci_kms_vault.R2C_vault.crypto_endpoint
}
