Role Name
=========

Create or delete Virtual Machines on VMWare.

Role Variables
--------------

- `infra_vmware_vm_action`: Action (createvm or deletevm)
- `infra_vmware_vm_vm_flavor`: Virtual Machine Flavor (default to small)
- `infra_vmware_vm_vcenter_server`: Virtual Machine vCenter Server
- `infra_vmware_vm_vcenter_datacenter`: Virtual Machine Datacenter
- `infra_vmware_vm_vcenter_cluster`: Virtual Machine Cluster
- `infra_vmware_vm_vm_name`: Virtual Machine Hostname
- `infra_vmware_vm_vm_state`: Virtual Machine State (defaults to poweredoff)
- `infra_vmware_vm_vm_guest_id`: Virtual Machine Guest Id ( defaults to centos7_64Guest )
- `infra_vmware_vm_vm_disk_size`: Virtual Machine Primary Disk size (expressed in GB)
- `infra_vmware_vm_vm_disk_type`: Virtual Machine Primary Disk type
- `infra_vmware_vm_vcenter_datastore`: Virtual Machine Secondary Datastore
- `infra_vmware_vm_add_secondary_disk`: Add Virtual Machine Secondary Disk (boolean)
- `infra_vmware_vm_vm_secondary_disk_size`: Virtual Machine Secondary Disk size (expressed in GB)
- `infra_vmware_vm_vm_secondary_disk_type`: Virtual Machine Secondary Disk type
- `infra_vmware_vm_vm_network`: Virtual Machine Network  
- `infra_vmware_vm_vm_ip`: Virtual Machine IP address (make sure it's available if creating a new VM)
- `infra_vmware_vm_vm_netmask`: Virtual Machine Network Mask
- `ldap_username`: Your ldap username
- `ldap_password`: Your ldap password


Example Playbook
----------------
Creates an small CentOS7 VM with hostname molecule_test.mylab.local on DCLAB adds extra 100 GB disk:

```
  hosts: all
  vars:
    infra_vmware_vm_action: "createvm"
    infra_vmware_vm_vm_flavor: 'small'
    infra_vmware_vm_vcenter_server: 'lab-vcenter.mylab.local'
    infra_vmware_vm_vcenter_datacenter: "DCLAB"
    infra_vmware_vm_vcenter_cluster: "Cluster-1"
    infra_vmware_vm_vm_name: 'molecule_test.mylab.local'
    infra_vmware_vm_vm_state: 'poweredoff'
    infra_vmware_vm_vm_guest_id: 'centos7_64Guest'
    infra_vmware_vm_vm_disk_size: 50
    infra_vmware_vm_vm_disk_type: 'eagerzeroedthick'
    infra_vmware_vm_vcenter_datastore: 'General-iSCSI'
    infra_vmware_vm_add_secondary_disk: true
    infra_vmware_vm_vm_secondary_disk_size: 100
    infra_vmware_vm_vm_secondary_disk_type: 'eagerzeroedthick'
    infra_vmware_vm_vm_network: 'Network1'
    infra_vmware_vm_vm_ip: '192.168.10.123'
    infra_vmware_vm_vm_netmask: '255.255.255.0'
    ldap_username: "your_ldap_username"
    ldap_password: "your_ldap_password"
  roles:
    - role: vmware_vm
      delegate_to: localhost
```

Author Information
------------------

**Jorge Rua** `<jruariveiro@gmail.com>`
