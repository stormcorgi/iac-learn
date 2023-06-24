variable "github-runner_ciuser" { type = string }
variable "github-runner_cipassword" { type = string }
variable "github-runner_ipconfig0" {
  type    = string
  default = "ip=100.64.1.132/22,gw=100.64.1.1"
}
variable "github-runner_sshkeys" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9tOFBPz2PBJ/m48vMvE7Jh/R/P3qvg3S/uTbLkoo60looq1q1BXfsJIFgnvOx7ytMnfZEYqGr4QlnwCKaC9PZY9+IlrkkMwEPvuL5iyJp7mbcREmIFh2pchX4ViMwSaROvGEN4TcXXkSA/aZoB8pMSTEcuaMNENGL8aW92fZzJNsol6yJ2SVy2z6pec1UHeeKjNEAArtCsA+E8csLTQXbdDQ7IzCYrHJJkYCLjPvb/apOMBIuMpUzhJ7Y+4g9vEtNK8XWThaD350mlAx//1M77huTXIWOWnbVNcNv7iW7s60Yl0FIUZNIuzpuN3OljJ+n7IXZV2Gq96x5LKjJqOeSZMzX0ph2fIj7ntqVVpZgSI08ZoXtOLtbyJQXxtEHtJxretx0mu1D/ikhzp8aTKuwF8uqjiWLiD4tiiSKrpdDY1rvNX/wlrfDwfCYca+eaVqDLol/HepsKDneV4BfqEJXD+dxFbR6ADs4m2oOzm0y76QWa5OKVUes94QNzupJV25+mQCtcZfWC88h49WzAq2R59SVEA87nvHwY2od9YQXGtIkZ5t65maTMNMInqAkt6E9yX7EYLujpHiorKl0F+aHtU6CZbOHTm2yZLNBHKlkYll+YYYxmSc1H8F0RP47KXnPvjtQgJye2PmLq+1JsynNEGeKinZ8VTX+Xav8GrbZEw== mac"
}

variable "proxmox_api_url" { type = string }
variable "proxmox_api_token_id" { type = string }
variable "proxmox_token" { type = string }
