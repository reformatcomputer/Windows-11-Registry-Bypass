@echo off
color 1e
cls
echo Detecting if you currently have the required permissions (Administrative)
net session >nul 2>&1
if %errorLevel% == 0 (
	echo Administrative permissions confirmed.
) else (
	color 4e
	echo ERROR: Required permissions not met.  Please RERUN as administrator.
	pause
	exit
)
cls
reg add "HKLM\SYSTEM\Setup\MoSetup" /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1
reg add "HKLM\SYSTEM\Setup" /v LabConfig /t REG_SZ /d ""
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassTPMCheck /t REG_DWORD /d 1
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassSecureBootCheck /t REG_DWORD /d 1
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassRAMCheck /t REG_DWORD /d 1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags" /v HwReqChk /t REG_SZ /d ""
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\HwReqChk" /v HwReqChkVars /t REG_MULTI_SZ /d "SQ_SecureBootCapable=TRUE\0SQ_SecureBootEnabled=TRUE\0SQ_TpmVersion=2\0SQ_RamMB=8192"
echo All registry entries imported.  Please download the Windows 11 ISO, mount it, and run setup.exe to perform in-place upgrade.
pause