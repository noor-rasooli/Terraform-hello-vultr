terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.3"  
    }
  }
}

provider "vultr" {
  api_key = "SILLVA2A6J3F6S4SKKSNXAPFNZFMWNFF2MRA"
}

resource "vultr_instance" "Noor-theGladiator" {
  label      = "Noor-theGladiator-instance"
  region     = "fra"              
  plan       = "vc2-1c-1gb"      
  os_id      = "352"

  user_data  = <<-EOF
    #!/bin/sh
    apt-get update
    apt-get install -y docker.io
    systemctl start docker
    systemctl enable docker

    git clone -b hello_vultr https://github.com/noor-rasooli/Terraform-day2.git C:\\Users\\Noor\\Desktop\\Terraform\\Test
    docker build -t your-docker-image C:\\Users\\Noor\\Desktop\\Terraform\\Test
    docker run -d -p 80:80 your-docker-image
  EOF
}

output "vm_ip_address" {
  value = vultr_instance.Noor-theGladiator.main_ip
}