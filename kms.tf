# KMS-ключ для шифрования Object Storage
resource "yandex_kms_symmetric_key" "netology" {
  name              = "netology-kms-15-3"
  description       = "Encryption key for Netology homework 15.3"
  folder_id         = "b1g6tqqvhv8rh3iuhp52"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"

  deletion_protection = true
}
