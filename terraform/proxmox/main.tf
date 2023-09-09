resource "proxmox_vm_qemu" "github-runner" {
  name        = "github-runner"
  target_node = "virt"
  clone       = "cloud-init-ubuntu-22.04"
  cpu         = "kvm64"
  cores       = 2
  memory      = 4096
  ciuser      = var.github-runner_ciuser
  cipassword  = var.github-runner_cipassword
  ipconfig0   = var.github-runner_ipconfig0
  sshkeys     = var.mac_sshkeys
  tags        = "github"
  onboot      = true

  disk {
    backup             = 0
    cache              = "none"
    file               = "vm-106-disk-0"
    format             = "raw"
    iops               = 0
    iops_max           = 0
    iops_max_length    = 0
    iops_rd            = 0
    iops_rd_max        = 0
    iops_rd_max_length = 0
    iops_wr            = 0
    iops_wr_max        = 0
    iops_wr_max_length = 0
    iothread           = 0
    mbps               = 0
    mbps_rd            = 0
    mbps_rd_max        = 0
    mbps_wr            = 0
    mbps_wr_max        = 0
    replicate          = 0
    slot               = 0
    ssd                = 0
    size               = "16588M"
    storage            = "prox-stripe"
    type               = "scsi"
    volume             = "prox-stripe:vm-106-disk-0"
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    macaddr   = "B2:49:BE:33:6B:1E"
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = -1
  }
}

resource "proxmox_vm_qemu" "ansible-semaphore" {
  name        = "ansible-semaphore"
  target_node = "virt"
  clone       = "cloud-init-ubuntu-22.04"
  cpu         = "kvm64"
  cores       = 2
  memory      = 4096
  ciuser      = var.github-runner_ciuser
  cipassword  = var.github-runner_cipassword
  ipconfig0   = var.github-runner_ipconfig0
  sshkeys     = var.mac_sshkeys
  tags        = ""
  onboot      = true

  disk {
    backup             = 0
    cache              = "none"
    file               = "vm-104-disk-0"
    format             = "raw"
    iops               = 0
    iops_max           = 0
    iops_max_length    = 0
    iops_rd            = 0
    iops_rd_max        = 0
    iops_rd_max_length = 0
    iops_wr            = 0
    iops_wr_max        = 0
    iops_wr_max_length = 0
    iothread           = 0
    mbps               = 0
    mbps_rd            = 0
    mbps_rd_max        = 0
    mbps_wr            = 0
    mbps_wr_max        = 0
    replicate          = 0
    slot               = 0
    ssd                = 0
    size               = "16588M"
    storage            = "prox-stripe"
    type               = "scsi"
    volume             = "prox-stripe:vm-104-disk-0"
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    # macaddr   = "B2:49:BE:33:6B:1E"
    model  = "virtio"
    mtu    = 0
    queues = 0
    rate   = 0
    tag    = -1
  }
}
