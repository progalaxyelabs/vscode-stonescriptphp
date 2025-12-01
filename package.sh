#!/bin/bash

# Package the VS Code extension
# Requires: npm install -g @vscode/vsce

echo "Packaging StoneScriptPHP VS Code Extension..."

# Check if vsce is installed
if ! command -v vsce &> /dev/null
then
    echo "vsce is not installed. Installing..."
    npm install -g @vscode/vsce
fi

# Package the extension
vsce package

echo "Done! Extension packaged as .vsix file"
echo ""
echo "To install locally:"
echo "  code --install-extension stonescriptphp-snippets-1.0.0.vsix"
echo ""
echo "To publish:"
echo "  vsce publish"
