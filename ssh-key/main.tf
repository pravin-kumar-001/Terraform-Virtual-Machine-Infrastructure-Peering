resource "tls_private_key" "ssh_key" {

  for_each = var.ssh_keys

  algorithm = each.value.algorithm

  rsa_bits = each.value.rsa_bits

}

resource "local_file" "private_key" {

  for_each = var.ssh_keys

  filename = "${path.module}/${each.value.key_name}"

  content = tls_private_key.ssh_key[each.key].private_key_openssh

  file_permission = "0600"

}

resource "local_file" "public_key" {

  for_each = var.ssh_keys

  filename = "${path.module}/${each.value.key_name}.pub"

  content = tls_private_key.ssh_key[each.key].public_key_openssh

}