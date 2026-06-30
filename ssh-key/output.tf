output "public_key" {

  value = {

    for key, value in tls_private_key.ssh_key :

    key => value.public_key_openssh

  }

}

output "private_key_file" {

  value = {

    for key, value in local_file.private_key :

    key => value.filename

  }

}

output "public_key_file" {

  value = {

    for key, value in local_file.public_key :

    key => value.filename

  }

}