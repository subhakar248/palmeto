variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "terraform"
}

variable "resource_group_location" {
  description = "location of the resource group"
  type        = string
  default     = "CENTRAL INDIA"
}

variable "vm_size" {
  description = "Instanace size in azure"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "User name for the vm"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Password for the VM"
  type        = string
  sensitive   = true
}

variable "custom_data_script" {
  description = "Script to execute during the machine provisioning"
  type        = string
  default     = <<-SCRIPT
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo echo "Welcome to terraform training - testing cganhes in the cutsom data" > /var/www/html/index.html
sudo systemctl start apache2
sudo systemctl enable apache2
SCRIPT
}
