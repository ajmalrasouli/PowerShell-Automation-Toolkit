# Logging Framework

The **Logging Framework** provides a consistent and reusable logging solution for the **PowerShell Automation Toolkit**.

It is designed to standardize how messages are written across every module in the toolkit, ensuring consistent formatting, colourized console output, optional file logging, and structured output for automation scenarios.

---

## Features

- ✅ Consistent log message format
- ✅ Five log levels
- ✅ Colourized console output
- ✅ Optional file logging
- ✅ Automatically creates log directories
- ✅ UTF-8 log file support
- ✅ Structured PowerShell object output
- ✅ Windows PowerShell 5.1 compatible
- ✅ PowerShell 7+ compatible
- ✅ PSScriptAnalyzer compliant

---

## Function

| Function | Description |
|----------|-------------|
| `Write-ToolkitLog` | Writes formatted log messages to the console and optionally to a log file. |

---

# Log Levels

| Level | Purpose | Console Colour |
|---------|---------|---------------|
| **Info** | General information | White |
| **Success** | Successful operation | Green |
| **Warning** | Warning requiring attention | Yellow |
| **Error** | Operation failed | Red |
| **Debug** | Diagnostic information | Cyan |

---

# Log Format

Every log entry uses the following format:

```text
YYYY-MM-DD HH:mm:ss [LEVEL] Message
```

Example:

```text
2026-07-09 20:35:11 [INFO] Toolkit started.

2026-07-09 20:35:18 [SUCCESS] Connected to Azure.

2026-07-09 20:35:27 [WARNING] Disk space below 15%.

2026-07-09 20:35:33 [ERROR] Unable to authenticate.
```

---

# Parameters

| Parameter | Required | Description |
|-----------|:--------:|-------------|
| `Message` | ✅ | Message to log |
| `Level` | ❌ | Logging level (`Info`, `Success`, `Warning`, `Error`, `Debug`) |
| `LogFile` | ❌ | Writes the log entry to a file |
| `NoConsole` | ❌ | Suppresses console output |
| `PassThru` | ❌ | Returns a PowerShell object |

---

# Basic Usage

```powershell
Write-ToolkitLog -Message "Toolkit started."

Write-ToolkitLog -Message "Connected to Azure." -Level Success

Write-ToolkitLog -Message "Disk space is low." -Level Warning

Write-ToolkitLog -Message "Authentication failed." -Level Error

Write-ToolkitLog -Message "Debug information." -Level Debug
```

---

# File Logging

Logs can be written to a file by specifying the `LogFile` parameter.

```powershell
Write-ToolkitLog `
    -Message "Backup completed." `
    -LogFile ".\Logs\Toolkit.log"
```

If the directory does not exist, it is created automatically.

---

# Returning Objects

The `PassThru` parameter returns a structured PowerShell object.

```powershell
Write-ToolkitLog `
    -Message "Pipeline test." `
    -PassThru
```

Output:

```text
Timestamp : 2026-07-09 20:45:01

Level     : INFO

Message   : Pipeline test.

Entry     : 2026-07-09 20:45:01 [INFO] Pipeline test.
```

This enables seamless integration with other PowerShell commands.

Example:

```powershell
Write-ToolkitLog `
    -Message "Server created." `
    -PassThru |
Export-Csv Logs.csv -NoTypeInformation
```

---

# Directory Structure

```text
shared/
└── Logging/
    ├── Write-ToolkitLog.ps1
    ├── README.md
    └── examples/
        ├── BasicLogging.ps1
        └── FileLogging.ps1
```

---

# Best Practices

- Use **Info** for normal operational messages.
- Use **Success** when an operation completes successfully.
- Use **Warning** when user attention is recommended.
- Use **Error** for failed operations.
- Use **Debug** for troubleshooting and development.
- Always log meaningful messages that provide context.
- Avoid logging sensitive information such as passwords, secrets, or access tokens.

---

# Future Enhancements

The Logging Framework is designed to grow with the toolkit.

Planned enhancements include:

- JSON logging
- Log rotation
- Event Viewer logging
- Azure Log Analytics integration
- Correlation IDs
- Execution duration
- Transcript support
- Additional output providers

---

# Related Documentation

- [PowerShell Automation Toolkit](../../README.md)
- [Examples](examples)

---

# Contributing

Contributions are welcome.

Please read the project's **CONTRIBUTING.md** before submitting changes.

---

# License

This project is licensed under the **MIT License**.

See the repository's `LICENSE` file for details.