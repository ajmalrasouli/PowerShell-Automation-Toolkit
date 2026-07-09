# Contributing to PowerShell-Automation-Toolkit

First of all, thank you for considering contributing to this project!

This toolkit aims to provide high-quality, reusable PowerShell automation for Windows, Microsoft 365, Azure, Microsoft Entra ID, Intune, Hyper-V, networking, security, and infrastructure management.

Whether you're fixing a bug, improving documentation, or adding a new module, your contributions are welcome.

---

# Project Goals

This project is built around the following principles:

- Quality over quantity
- Clean, readable code
- Consistent coding standards
- Reusable automation
- Comprehensive documentation
- Enterprise-ready solutions

---

# Development Standards

## PowerShell Version

- Windows PowerShell 5.1
- PowerShell 7+

Scripts should remain compatible whenever practical.

---

## Naming Convention

Use approved PowerShell verbs.

Examples:

```powershell
Get-UserInventory
New-ADUserReport
Remove-StaleComputer
Test-NetworkConnection
```

---

## Script Requirements

Every script should include:

- Comment-based help
- CmdletBinding()
- Parameter validation
- Try/Catch error handling
- Verbose logging
- Meaningful output objects
- Examples

---

# Repository Structure

Place new code in the appropriate module folder.

```text
modules/

ActiveDirectory/

Azure/

EntraID/

HyperV/

Intune/

Microsoft365/

Networking/

Reports/

Security/

Storage/

Utilities/
```

---

# Documentation

All new scripts should include:

- Overview
- Parameters
- Examples
- Notes
- Expected output

Update the README when introducing significant features.

---

# Commit Messages

This project follows the Conventional Commits specification.

Examples:

```text
feat: add Active Directory inventory script

fix: improve Azure authentication

docs: update installation guide

refactor: simplify logging module

test: add Pester tests
```

---

# Pull Requests

Before submitting a Pull Request, ensure:

- Code follows PowerShell best practices.
- Documentation has been updated.
- Scripts have been tested.
- No unnecessary files are included.

---

# Reporting Issues

Please include:

- PowerShell version
- Operating system
- Expected behaviour
- Actual behaviour
- Error messages
- Steps to reproduce

---

# Thank You

Thank you for helping improve PowerShell-Automation-Toolkit!

Every contribution helps make the toolkit more useful for the PowerShell community.