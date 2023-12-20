

# Available actions: Create, Update (name, initiator, consistent_lun, host_flags), Delete and Import an existing host from the PowerMax Array.
# After `terraform apply` of this example file it will create a new host with the name set in `name` attribute on the PowerMax

# PowerMax hosts systems are storage hosts that use storage system LUN resources.
# A logical unit number (LUN) is an identifier that is used for labeling and designating subsystems of physical or virtual storage.
resource "powermax_host" "host_1" {

  # Attributes which are able to be modified after create (name, initiator, consistent_lun, host_flags)

  # Required is the name of the host. 
  # Only alphanumeric characters, underscores ( _ ), and hyphens (-) are allowed
  name = "host_1"

  # Required The initiator(s) associated with the host
  initiator = ["10000000c9fc4b7e"]

  # Optional consistent_lun the lun addresses on the source are consistent across all paths
  consistent_lun = false

  # Optional host flags
  # All flags are optional and have 2 possible values enabled (to enable that flag on the PowerMax) and override (to force that flag to be set on the PowerMax)
  # If a flag is not set then it will have a default value of false
  host_flags = {

    # Optional It enables a SCSI bus reset to only occur to the port that received the reset.
    avoid_reset_broadcast = {
      override = true
      enabled  = true
    }

    # Optional It is used for hosts that do not expect the queue to be flushed on a 0629 sense.
    disable_q_reset_on_ua = {
      override = true
      enabled  = true
    }

    # Optional It enables the environmental error reporting by the storage system to the host on the specific port.
    environ_set = {
      override = true
      enabled  = true
    }

    # Optional This attribute enables an Open VMS fibre connection
    openvms = {
      override = true
      enabled  = true
    }

    # Optional This attribute provides a stricter compliance with SCSI standards
    scsi_support1 = {
      override = true
      enabled  = true
    }

    # Optional SPC2 Protocol flag. When setting this flag, the port must be offline
    spc2_protocol_version = {
      override = true
      enabled  = true
    }

    # Optional Alters the inquiry data to report that the storage system supports the SCSI-3 protocol
    scsi_3 = {
      override = true
      enabled  = true
    }

    # Optional It enables the volume set addressing mode
    volume_set_addressing = {
      override = true
      enabled  = true
    }
  }
}

# After the execution of above resource block, a PowerMax host has been created at PowerMax array.
# For more information about the newly created resource use the `terraform show` command to review the current state
