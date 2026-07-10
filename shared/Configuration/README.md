# Configuration Framework

The **Configuration Framework** provides a centralized and reusable configuration system for the **PowerShell Automation Toolkit**.

It enables every module in the toolkit to load configuration from a JSON file using a consistent interface, reducing duplicated code and simplifying maintenance.

---

# Features

- ✅ JSON configuration support
- ✅ Automatic file validation
- ✅ JSON syntax validation
- ✅ Returns PowerShell objects
- ✅ Logging integration
- ✅ Shared across all toolkit modules
- ✅ Windows PowerShell 5.1 compatible
- ✅ PowerShell 7 compatible
- ✅ PSScriptAnalyzer compliant
- ✅ Pester tested

---

# Function

| Function | Description |
|----------|-------------|
| `Get-ToolkitConfig` | Loads and validates a JSON configuration file and returns a PowerShell object. |

---

# Configuration File

The toolkit uses a JSON configuration file.

Example:

```json
{
  "Logging": {
    "LogLevel": "Info",
    "LogFile": ".\\Logs\\Toolkit.log"
  },

  "Azure": {
    "SubscriptionId": "",
    "TenantId": ""
  }
}
```

A complete example is provided in:

```text
config.sample.json
```

---

# Getting Started

Copy the sample configuration:

```text
config.sample.json
```

to

```text
config.json
```

Update the values to match your environment.

Example:

```powershell
$config = Get-ToolkitConfig -Path ".\config.json"
```

---

# Returned Object

The function returns a PowerShell object.

Example:

```powershell
$config.Logging.LogLevel

$config.Azure.SubscriptionId

$config.ActiveDirectory.DomainName
```

---

# Examples

Load a configuration file:

```powershell
$config = Get-ToolkitConfig `
    -Path ".\config.json"
```

Access configuration values:

```powershell
$config.Logging.LogFile

$config.Toolkit.Environment

$config.HyperV.SwitchName
```

---

# Validation

The Configuration Framework automatically validates:

- Configuration file exists
- Valid JSON format
- Successful parsing

If validation fails, a descriptive exception is thrown.

Example:

```text
Configuration file 'config.json' does not exist.
```

or

```text
Invalid JSON configuration file.
```

---

# Logging Integration

The Configuration Framework integrates with the Logging Framework.

Successful operations are logged using:

```powershell
Write-ToolkitLog
```

This provides consistent logging across every toolkit module.

---

# Directory Structure

```text
shared/
└── Configuration/
    ├── Get-ToolkitConfig.ps1
    ├── config.sample.json
    ├── README.md
    └── examples/
        ├── BasicConfig.ps1
        └── JsonConfig.ps1
```

---

# Best Practices

- Copy `config.sample.json` to `config.json`.
- Never modify `config.sample.json`.
- Never commit secrets, passwords, or API keys.
- Store environment-specific settings in your own `config.json`.
- Keep configuration outside of your scripts.
- Validate configuration before running automation.

---

# Security

Never store:

- Passwords
- Client secrets
- API keys
- Access tokens
- Certificates

inside `config.sample.json`.

Use secure storage such as:

- Azure Key Vault
- Windows Credential Manager
- SecretManagement module

for sensitive information.

---

# Roadmap

Future enhancements include:

- Environment-specific configurations
- Configuration schema validation
- Default values
- Encrypted configuration support
- Azure Key Vault integration
- SecretManagement integration

---

# Related Documentation

- [Logging Framework](../Logging/README.md)
- [PowerShell Automation Toolkit](../../README.md)

---

# Contributing

Contributions are welcome.

Please read **CONTRIBUTING.md** before submitting pull requests.

---

# License

Licensed under the **MIT License**.

See the repository `LICENSE` file for details.