# Windows 11 Upgrade Script

This script is designed to modify the Windows registry to allow upgrades to Windows 11 on systems that do not meet the standard TPM, Secure Boot, and RAM requirements. It checks for administrative permissions before making any changes.

Requirements:

* Windows operating system
* Administrative privileges

## Script Overview

The script performs the following actions:

1. **Check for Administrative Permissions**:
    - The script first checks if it is being run with administrative privileges. If not, it prompts the user to rerun the script as an administrator.

2. **Modify Registry Keys**:
    - The script adds several registry keys to bypass the hardware requirements for upgrading to Windows 11.

## Registry Keys Explained

- **HKLM\SYSTEM\Setup\MoSetup**
    - `AllowUpgradesWithUnsupportedTPMOrCPU` (REG_DWORD): Set to `1` to allow upgrades on systems with unsupported TPM or CPU.

- **HKLM\SYSTEM\Setup**
    - `LabConfig` (REG_SZ): Creates a new key for lab configuration settings.

- **HKLM\SYSTEM\Setup\LabConfig**
    - `BypassTPMCheck` (REG_DWORD): Set to `1` to bypass the TPM check.
    - `BypassSecureBootCheck` (REG_DWORD): Set to `1` to bypass the Secure Boot check.
    - `BypassRAMCheck` (REG_DWORD): Set to `1` to bypass the RAM check.

- **HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags**
    - `HwReqChk` (REG_SZ): Creates a new key for hardware requirement checks.

- **HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\HwReqChk**
    - `HwReqChkVars` (REG_MULTI_SZ): Sets multiple values to indicate that the system is Secure Boot capable, Secure Boot enabled, TPM version 2.0, and has 8192 MB of RAM.

## Usage

1. Run the script as an administrator.
2. Follow the on-screen prompts.
3. Once the registry entries are imported, download the Windows 11 ISO, mount it, and run `setup.exe` to perform an in-place upgrade.

---

Feel free to customize this README to better fit your needs!


Disclaimer:

This script is provided for informational purposes only. The author/organization is not responsible for any consequences of using this script.