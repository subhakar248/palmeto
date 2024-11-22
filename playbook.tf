resource "ansible_host" "my_vm" {
  name   = azurerm_public_ip.training.ip_address
  groups = ["web"]
}

resource "ansible_playbook" "webapp" {
  name       = azurerm_public_ip.training.ip_address
  playbook   = "./playbook.yaml"
  extra_vars = {
    ansible_user = var.admin_username
    ansible_ssh_private_key_file = "~/.ssh/id_rsa"
  }
}
