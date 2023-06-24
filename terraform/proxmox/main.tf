resource "proxmox_vm_qemu" "github-runner" {
  name        = "github-runner"
  target_node = "virt"
  clone       = "cloud-init-ubuntu-22.04"
  cpu         = "kvm64"
  cores       = 2
  memory      = 4096
  # iso         = "local:iso/debian-11.5.0-amd64-netinst.iso"
  ciuser     = var.github-runner_ciuser
  cipassword = var.github-runner_cipassword
  ipconfig0  = var.github-runner_ipconfig0
  sshkeys    = var.github-runner_sshkeys
  tags       = "github"
  onboot     = true

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

resource "proxmox_vm_qemu" "k3s-con" {
  agent                  = 0
  balloon                = 0
  bios                   = "seabios"
  boot                   = "order=scsi0;ide2"
  cores                  = 2
  cpu                    = "host"
  define_connection_info = true
  force_create           = false
  full_clone             = false
  hotplug                = "network,disk,usb"
  kvm                    = true
  memory                 = 4096
  name                   = "k3s-con"
  numa                   = false
  onboot                 = true
  qemu_os                = "l26"
  scsihw                 = "virtio-scsi-pci"
  startup                = "up=300"
  tablet                 = true
  tags                   = "k3s"
  target_node            = "virt"

  disk {
    backup             = 0
    cache              = "none"
    file               = "vm-105-disk-0"
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
    size               = "32G"
    slot               = 0
    ssd                = 0
    storage            = "prox-raid"
    type               = "scsi"
    volume             = "prox-raid:vm-105-disk-0"
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    macaddr   = "FE:A4:68:32:1A:2A"
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = -1
  }

  timeouts {}
  lifecycle {
    prevent_destroy = true
  }
}
