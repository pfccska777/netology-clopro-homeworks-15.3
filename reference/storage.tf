# Object Storage
resource "yandex_storage_bucket" "netology" {
  bucket    = "pfccska777-netology-15-2-20261116"
  folder_id = "b1g6tqqvhv8rh3iuhp52"

  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }

  # Шифрование объектов ключом KMS из задания 15.3
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "abj7iqd1lb0u5l806tqs"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

# Загрузка изображения
resource "yandex_storage_object" "image" {
  bucket       = yandex_storage_bucket.netology.bucket
  key          = "image.jpg"
  source       = "${path.module}/images/image.jpg"
  source_hash  = filemd5("${path.module}/images/image.jpg")
  content_type = "image/jpeg"
  acl          = "public-read"
}
