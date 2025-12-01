# Quick Start Guide

## For Users

### Install the Extension

**Option 1: From VS Code Marketplace** (when published)
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "StoneScriptPHP Snippets"
4. Click Install

**Option 2: From .vsix File**
1. Download the `.vsix` file
2. Run: `code --install-extension stonescriptphp-snippets-1.0.0.vsix`
3. Reload VS Code

### Use the Snippets

1. Open or create a PHP file
2. Type a snippet prefix (e.g., `stone-route-get`)
3. Press `Tab` or `Enter` to expand
4. Use `Tab` to jump between placeholders
5. Fill in your values

### Most Common Snippets

```php
// Create a simple GET route
stone-route-get

// Create a POST route with validation
stone-route-post

// Create a model
stone-model

// Create a contract
stone-contract-route

// Create request/response DTOs
stone-dto-request
stone-dto-response
```

## For Developers/Publishers

### Quick Package and Test

```bash
# Navigate to extension directory
cd /ssd2/projects/progalaxy-elabs/foundation/stonescriptphp/vscode-stonescriptphp

# Package (requires vsce)
npm install -g @vscode/vsce
./package.sh

# Install locally
code --install-extension stonescriptphp-snippets-1.0.0.vsix

# Test in VS Code
# 1. Open a PHP file
# 2. Type stone-route-get
# 3. Verify snippet expands correctly
```

### Quick Publish

```bash
# Login (one time)
vsce login progalaxy-elabs

# Publish
vsce publish

# Or publish with version bump
vsce publish patch  # 1.0.0 -> 1.0.1
vsce publish minor  # 1.0.0 -> 1.1.0
vsce publish major  # 1.0.0 -> 2.0.0
```

### Quick Update

1. Edit snippet files in `snippets/` directory
2. Update version in `package.json`
3. Update `CHANGELOG.md`
4. Test changes locally
5. Publish: `vsce publish`

## File Locations

- **Snippets:** `snippets/*.json`
- **Config:** `package.json`
- **Docs:** `*.md` files
- **Package script:** `package.sh`

## Testing Checklist

- [ ] Each snippet expands correctly
- [ ] Tab navigation works between placeholders
- [ ] PHPDoc comments are properly formatted
- [ ] All snippets follow StoneScriptPHP conventions
- [ ] No JSON syntax errors
- [ ] Extension metadata is correct

## Support

- Documentation: See `README.md`
- Full reference: See `SNIPPETS_REFERENCE.md`
- Installation: See `INSTALL.md`
- Project info: See `PROJECT_SUMMARY.md`

## Snippet Prefix Patterns

All snippets follow this pattern:
- `stone-route-*` - Route snippets
- `stone-model-*` - Model snippets
- `stone-contract-*` - Contract snippets
- `stone-dto-*` - DTO snippets

## Quick Reference

| Prefix | Description |
|--------|-------------|
| `stone-route-get` | GET route |
| `stone-route-post` | POST route with validation |
| `stone-route-contract` | Route with contract |
| `stone-route-health` | Health check |
| `stone-model` | Model class |
| `stone-model-create` | Create method |
| `stone-model-get` | Get method |
| `stone-model-update` | Update method |
| `stone-model-delete` | Delete method |
| `stone-contract` | Basic contract |
| `stone-contract-route` | Route contract |
| `stone-dto-request` | Request DTO |
| `stone-dto-response` | Response DTO |

See `SNIPPETS_REFERENCE.md` for complete list.
