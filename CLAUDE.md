# vscode-stonescriptphp - Developer Guide

## Project Overview

**vscode-stonescriptphp** is a VS Code extension that provides code snippets for the StoneScriptPHP framework. It enables developers to quickly scaffold routes, models, contracts, and DTOs in PHP projects using StoneScriptPHP.

## Quick Facts

- **Type:** VS Code Extension (Snippet Pack)
- **Language:** PHP
- **Framework:** StoneScriptPHP
- **Repository:** https://github.com/progalaxyelabs/vscode-stonescriptphp
- **Version:** 1.0.1
- **License:** MIT

## Project Structure

```
vscode-stonescriptphp/
├── README.md              # Main documentation
├── package.json           # VS Code extension manifest
├── icon.png              # Extension icon
├── snippets/
│   ├── routes.json       # Route snippet definitions
│   ├── models.json       # Model snippet definitions
│   ├── contracts.json    # Contract snippet definitions
│   └── dto.json          # DTO snippet definitions
├── CHANGELOG.md          # Version history
├── LICENSE               # MIT license
└── [supporting docs]     # Other guides
```

## Key Features

The extension provides 30+ pre-configured snippets:

- **Routes:** GET, POST, contracts, health checks
- **Models:** CRUD operations (create, read, update, delete)
- **Contracts:** Interfaces for routes, services, repositories
- **DTOs:** Request/response objects with validation support

## Development Setup

### Prerequisites

- VS Code 1.80.0+
- Node.js (for development/testing)
- npm (for package management)

### Local Testing

```bash
cd vscode-stonescriptphp
npm install
# Use VS Code's "Run Extension" feature (F5) to test
```

## Extension Contribution

The extension contributes snippets via `package.json`:

```json
"contributes": {
  "snippets": [
    {"language": "php", "path": "./snippets/routes.json"},
    {"language": "php", "path": "./snippets/models.json"},
    {"language": "php", "path": "./snippets/contracts.json"},
    {"language": "php", "path": "./snippets/dto.json"}
  ]
}
```

Each JSON file defines snippets with trigger prefixes (e.g., `stone-route-get`).

## Publishing to VS Code Marketplace

The extension can be published via:

```bash
npm install -g vsce
vsce publish
```

Requires authentication with VS Code Marketplace.

## Support

- **Issues:** https://github.com/progalaxyelabs/vscode-stonescriptphp/issues
- **Discussions:** https://github.com/progalaxyelabs/vscode-stonescriptphp/discussions

## Related Projects

- **StoneScriptPHP:** Core PHP framework (`/ssd2/projects/progalaxy-elabs/opensource/stonescriptphp`)
- **Progalaxy E-Labs:** Main development platform
