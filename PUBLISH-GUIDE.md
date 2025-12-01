# Publishing StoneScriptPHP Extension to VS Code Marketplace

## Prerequisites Checklist

Before publishing, ensure you have:
- [ ] Microsoft account (for Azure DevOps)
- [ ] Publisher account on VS Code Marketplace
- [ ] Personal Access Token (PAT) from Azure DevOps
- [ ] Extension icon (128x128 PNG recommended)
- [ ] All extension files ready

## Step 1: Install vsce (VS Code Extension Manager)

```bash
npm install -g @vscode/vsce
```

## Step 2: Create Publisher Account

### A. Sign in to Visual Studio Marketplace
1. Go to https://marketplace.visualstudio.com/manage
2. Sign in with your Microsoft account
3. Click "Create publisher"
4. Fill in details:
   - **Publisher ID**: `progalaxy-elabs` (must match package.json)
   - **Display Name**: `ProGalaxy eLabs`
   - **Description**: `Enterprise software solutions and open source tools`
   - **Website**: `https://stonescriptphp.org`

### B. Create Personal Access Token (PAT)
1. Go to https://dev.azure.com
2. Sign in with the same Microsoft account
3. Click your profile icon → "Personal access tokens"
4. Click "New Token"
5. Configure:
   - **Name**: `vscode-marketplace-stonescriptphp`
   - **Organization**: All accessible organizations
   - **Expiration**: 90 days (or custom)
   - **Scopes**:
     - Select "Custom defined"
     - Check "Marketplace" → "Manage"
6. Click "Create"
7. **IMPORTANT**: Copy the token immediately (you won't see it again!)
8. Save it securely (e.g., password manager)

## Step 3: Prepare Extension

### Update package.json

Add these fields if missing:

```json
{
  "icon": "icon.png",
  "galleryBanner": {
    "color": "#1e1e1e",
    "theme": "dark"
  },
  "homepage": "https://github.com/progalaxyelabs/vscode-stonescriptphp",
  "bugs": {
    "url": "https://github.com/progalaxyelabs/vscode-stonescriptphp/issues"
  },
  "qna": "https://github.com/progalaxyelabs/vscode-stonescriptphp/discussions"
}
```

### Create Extension Icon

Create a 128x128 PNG icon at `icon.png` in the extension root.

**Quick icon creation:**
```bash
# If you have ImageMagick installed
convert -size 128x128 xc:transparent -font Arial -pointsize 72 \
  -fill "#00D9FF" -gravity center -annotate +0+0 "S" icon.png
```

Or use an online tool like:
- https://www.canva.com (128x128 design)
- https://www.figma.com
- https://pixlr.com/editor/

### Verify Extension Structure

```bash
cd /ssd2/projects/progalaxy-elabs/foundation/stonescriptphp/vscode-stonescriptphp

# Should have:
ls -la package.json     # ✓
ls -la README.md        # ✓
ls -la CHANGELOG.md     # ✓
ls -la LICENSE          # ✓
ls -la icon.png         # Add this!
ls -la snippets/        # ✓
```

## Step 4: Package Extension

```bash
cd /ssd2/projects/progalaxy-elabs/foundation/stonescriptphp/vscode-stonescriptphp

# Package the extension
vsce package

# This creates: stonescriptphp-snippets-1.0.0.vsix
```

**Test the packaged extension locally:**
```bash
code --install-extension stonescriptphp-snippets-1.0.0.vsix
```

## Step 5: Publish to Marketplace

### Option A: Publish via CLI (Recommended)

```bash
cd /ssd2/projects/progalaxy-elabs/foundation/stonescriptphp/vscode-stonescriptphp

# Login with your PAT (one-time setup)
vsce login progalaxy-elabs
# Paste your Personal Access Token when prompted

# Publish the extension
vsce publish

# Or publish and bump version in one command:
vsce publish patch  # 1.0.0 → 1.0.1
vsce publish minor  # 1.0.0 → 1.1.0
vsce publish major  # 1.0.0 → 2.0.0
```

### Option B: Publish via Web UI

1. Go to https://marketplace.visualstudio.com/manage/publishers/progalaxy-elabs
2. Click "+ New extension" → "Visual Studio Code"
3. Drag and drop `stonescriptphp-snippets-1.0.0.vsix`
4. Click "Upload"

## Step 6: Verify Publication

1. Wait 5-10 minutes for publication to complete
2. Check your extension at:
   ```
   https://marketplace.visualstudio.com/items?itemName=progalaxy-elabs.stonescriptphp-snippets
   ```
3. Test installation:
   ```bash
   code --install-extension progalaxy-elabs.stonescriptphp-snippets
   ```

## Step 7: Update README with Installation Badge

Add to your main StoneScriptPHP README:

```markdown
[![VS Code Extension](https://img.shields.io/visual-studio-marketplace/v/progalaxy-elabs.stonescriptphp-snippets)](https://marketplace.visualstudio.com/items?itemName=progalaxy-elabs.stonescriptphp-snippets)
[![Installs](https://img.shields.io/visual-studio-marketplace/i/progalaxy-elabs.stonescriptphp-snippets)](https://marketplace.visualstudio.com/items?itemName=progalaxy-elabs.stonescriptphp-snippets)
```

## Publishing Updates

When you make changes:

```bash
# 1. Update CHANGELOG.md
# 2. Update version in package.json (or use vsce)
# 3. Publish:

vsce publish patch  # Bug fixes
vsce publish minor  # New features
vsce publish major  # Breaking changes
```

## Troubleshooting

### Error: "Publisher 'progalaxy-elabs' not found"
- Create publisher account first (Step 2A)
- Ensure publisher ID matches package.json exactly

### Error: "Personal access token is invalid"
- Token may have expired
- Create new token with "Marketplace (Manage)" scope
- Use `vsce login progalaxy-elabs` with new token

### Error: "Extension validation failed"
- Run `vsce package` locally first
- Check for errors in package.json
- Ensure all snippet files exist

### Warning: "Icon missing"
- Add 128x128 PNG icon
- Update package.json with `"icon": "icon.png"`

## Security Best Practices

1. **Never commit PAT to git**
   ```bash
   # Store in environment variable
   export VSCE_PAT="your-token-here"
   vsce publish -p $VSCE_PAT
   ```

2. **Rotate tokens regularly**
   - Set 90-day expiration
   - Create new token before expiration
   - Revoke old tokens

3. **Use .vscodeignore**
   Prevent publishing unnecessary files:
   ```
   .git
   node_modules
   *.vsix
   PUBLISH-GUIDE.md
   TASK_COMPLETION_REPORT.md
   PROJECT_SUMMARY.md
   ```

## Automation (GitHub Actions)

Create `.github/workflows/publish-vscode.yml`:

```yaml
name: Publish VS Code Extension

on:
  push:
    tags:
      - 'v*'

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install vsce
        run: npm install -g @vscode/vsce

      - name: Publish
        run: vsce publish -p ${{ secrets.VSCE_PAT }}
        env:
          VSCE_PAT: ${{ secrets.VSCE_PAT }}
```

Then add `VSCE_PAT` to GitHub Secrets.

## Resources

- **VS Code Marketplace**: https://marketplace.visualstudio.com/vscode
- **Publishing Guide**: https://code.visualstudio.com/api/working-with-extensions/publishing-extension
- **vsce Documentation**: https://github.com/microsoft/vscode-vsce
- **Extension Guidelines**: https://code.visualstudio.com/api/references/extension-guidelines

## Quick Checklist

Before publishing:
- [ ] Extension works locally (`code --install-extension *.vsix`)
- [ ] package.json has all required fields
- [ ] README.md is comprehensive
- [ ] CHANGELOG.md is updated
- [ ] LICENSE file exists
- [ ] Icon file exists (128x128 PNG)
- [ ] .vscodeignore excludes unnecessary files
- [ ] Publisher account created
- [ ] Personal Access Token created and saved
- [ ] vsce installed (`npm install -g @vscode/vsce`)

Ready to publish:
```bash
vsce login progalaxy-elabs
vsce publish
```
