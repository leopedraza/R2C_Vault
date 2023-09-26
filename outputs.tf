output "CipherText" {
    value =  <<EOT
Este es el texto cifrado:
${oci_kms_encrypted_data.Encrypted_data_R2C.ciphertext}
para obtener el texto plano solo necesitas el cloud Shell y el OCID de tu llave.
https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.33.0/oci_cli_docs/cmdref/kms/crypto/decrypt.html
Ten en cuenta que tu resultado es base64
EOT
}

output "Llave_OCID" {
${oci_kms_key.R2C_key.id}

}