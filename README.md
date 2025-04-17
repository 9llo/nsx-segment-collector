# NSX Port Group Inspector

This PowerShell script connects to a VMware vCenter Server using PowerCLI and retrieves detailed NSX-related information about a specified port group.

---

## 🔧 Features

- Prompts for:
  - vCenter Server address
  - User credentials
  - Port group name
- Verifies if the port group is NSX-backed
- Displays detailed segment information:
  - Segment ID
  - Transport Zone UUID & Name
  - Logical Switch UUID
  - VNI (VXLAN Network Identifier)
- Gracefully disconnects from vCenter

---

## 🧰 Requirements

- PowerShell 5.1+ or PowerShell Core
- [VMware PowerCLI](https://developer.vmware.com/powercli)
- Access to a vCenter Server with NSX-T integrated

---

## 🚀 How to Use

1. Launch PowerShell.
2. Run the script:
   ```powershell
   .\nsx-segment.ps1
   ```