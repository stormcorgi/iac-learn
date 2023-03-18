resource "proxmox_vm_qemu" "provision-test" {
  name        = "provision-test"
  target_node = "virt"
  clone       = "cloud-init-ubuntu-22.04"
  cpu         = "kmv64"
  cores       = 1
  memory      = 4096
  # iso         = "local:iso/debian-11.5.0-amd64-netinst.iso"
  ciuser     = "ubuntu"
  disk {
    backup             = 0
    cache              = "none"
    file               = "vm-107-disk-0"
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
    storage            = "prox-raid"
    type               = "scsi"
    volume             = "prox-raid:vm-107-disk-0"
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

