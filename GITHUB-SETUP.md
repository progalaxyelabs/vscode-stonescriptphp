# GitHub Repository Setup

## Create the Repository on GitHub

1. Go to https://github.com/organizations/progalaxyelabs/repositories/new

2. Fill in:
   - **Repository name**: `vscode-stonescriptphp`
   - **Description**: `VS Code extension providing code snippets for StoneScriptPHP framework development`
   - **Visibility**: Public
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)

3. Click "Create repository"

## Connect Local Repository to GitHub

```bash
cd /ssd2/projects/progalaxy-elabs/foundation/stonescriptphp/vscode-stonescriptphp

# Add remote
git remote add origin git@github.com:progalaxyelabs/vscode-stonescriptphp.git

# Verify
git remote -v

# Push to GitHub
git push -u origin main
```

## Verify

After pushing, visit:
https://github.com/progalaxyelabs/vscode-stonescriptphp

You should see:
- README.md displayed
- LICENSE badge
- All snippets in snippets/ directory

## Next Steps

After the repository is live on GitHub:

1. **Update VS Code Marketplace links** - The package.json already has the correct URLs
2. **Enable GitHub Discussions** (optional):
   - Go to Settings → General → Features
   - Enable "Discussions"
3. **Add topics**:
   - vscode-extension
   - stonescriptphp
   - php-snippets
   - code-snippets

## Publishing to VS Code Marketplace

Once the GitHub repo is live, follow PUBLISH-GUIDE.md:

```bash
# Install vsce (already done)
npm install -g @vscode/vsce

# Package extension
vsce package

# Test locally
code --install-extension stonescriptphp-snippets-1.0.0.vsix

# Publish to marketplace
vsce login progalaxyelabs
vsce publish
```

The extension will be available at:
https://marketplace.visualstudio.com/items?itemName=progalaxyelabs.stonescriptphp-snippets
