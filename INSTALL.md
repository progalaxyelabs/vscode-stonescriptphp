# Installation and Publishing Guide

## Prerequisites

1. Node.js and npm installed
2. Visual Studio Code Extension Manager (vsce)

Install vsce globally:
```bash
npm install -g @vscode/vsce
```

## Package the Extension

### Option 1: Using the Package Script
```bash
./package.sh
```

### Option 2: Manual Packaging
```bash
vsce package
```

This will create a `.vsix` file (e.g., `stonescriptphp-snippets-1.0.0.vsix`)

## Install Locally

### Via Command Line
```bash
code --install-extension stonescriptphp-snippets-1.0.0.vsix
```

### Via VS Code UI
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X or Cmd+Shift+X)
3. Click the "..." menu at the top right
4. Select "Install from VSIX..."
5. Choose the `.vsix` file

## Test the Extension

1. Open a PHP file in VS Code
2. Type one of the snippet prefixes:
   - `stone-route-get`
   - `stone-model`
   - `stone-contract`
   - `stone-dto-request`
3. Press Tab or Enter to expand the snippet
4. Use Tab to navigate between placeholders

## Publishing to VS Code Marketplace

### 1. Create a Publisher Account

1. Go to https://marketplace.visualstudio.com/manage
2. Sign in with Microsoft account
3. Create a publisher ID (if you don't have one)

### 2. Get a Personal Access Token

1. Go to https://dev.azure.com/
2. Create a Personal Access Token with "Marketplace (Manage)" scope
3. Save the token securely

### 3. Login to vsce

```bash
vsce login progalaxy-elabs
```

Enter your Personal Access Token when prompted.

### 4. Publish the Extension

```bash
vsce publish
```

Or publish a specific version:
```bash
vsce publish 1.0.0
```

Or publish with a version bump:
```bash
vsce publish minor  # 1.0.0 -> 1.1.0
vsce publish patch  # 1.0.0 -> 1.0.1
vsce publish major  # 1.0.0 -> 2.0.0
```

## Publishing to Open VSX (Optional)

Open VSX is an open-source alternative to the VS Code Marketplace.

1. Install ovsx:
```bash
npm install -g ovsx
```

2. Get an access token from https://open-vsx.org/

3. Publish:
```bash
ovsx publish -p YOUR_ACCESS_TOKEN
```

## Updating the Extension

1. Make your changes to the snippets or configuration
2. Update the version in `package.json`
3. Update `CHANGELOG.md` with changes
4. Package and publish:
```bash
vsce publish
```

## Troubleshooting

### vsce not found
```bash
npm install -g @vscode/vsce
```

### Package validation errors
- Ensure all snippet files are valid JSON
- Check that package.json is properly formatted
- Verify all referenced files exist

### Publishing permission errors
- Verify you're logged in: `vsce login`
- Check your Personal Access Token is valid
- Ensure you have publisher permissions

## Files Overview

```
vscode-stonescriptphp/
├── package.json           # Extension manifest
├── README.md             # User documentation
├── CHANGELOG.md          # Version history
├── LICENSE               # MIT License
├── .vscodeignore         # Files to exclude from package
├── .gitignore           # Git ignore rules
├── package.sh           # Packaging script
├── INSTALL.md           # This file
├── ICON_README.md       # Icon instructions
└── snippets/
    ├── routes.json      # Route snippets
    ├── models.json      # Model snippets
    ├── contracts.json   # Contract snippets
    └── dto.json         # DTO snippets
```

## Resources

- [VS Code Extension Publishing](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)
- [vsce Documentation](https://github.com/microsoft/vscode-vsce)
- [Extension Marketplace](https://marketplace.visualstudio.com/)
