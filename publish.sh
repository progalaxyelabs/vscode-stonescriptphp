#!/bin/bash
# Quick publish script for StoneScriptPHP VS Code Extension

set -e  # Exit on error

echo "📦 Publishing StoneScriptPHP VS Code Extension"
echo ""

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo "❌ vsce not found. Installing..."
    npm install -g @vscode/vsce
fi

# Check for icon
if [ ! -f "icon.png" ]; then
    echo "⚠️  Icon missing. Creating default icon..."
    ./create-icon.sh
fi

# Validate package
echo "🔍 Validating extension..."
vsce ls

# Ask for publish type
echo ""
echo "How do you want to publish?"
echo "  1. Package only (.vsix file)"
echo "  2. Publish to marketplace (patch version)"
echo "  3. Publish to marketplace (minor version)"
echo "  4. Publish to marketplace (major version)"
echo ""
read -p "Choose (1-4): " choice

case $choice in
    1)
        echo "📦 Packaging extension..."
        vsce package
        echo "✅ Package created!"
        ls -lh *.vsix
        ;;
    2)
        echo "🚀 Publishing patch version..."
        vsce publish patch
        echo "✅ Published!"
        ;;
    3)
        echo "🚀 Publishing minor version..."
        vsce publish minor
        echo "✅ Published!"
        ;;
    4)
        echo "🚀 Publishing major version..."
        vsce publish major
        echo "✅ Published!"
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "🎉 Done!"
echo ""
echo "View on marketplace:"
echo "https://marketplace.visualstudio.com/items?itemName=progalaxy-elabs.stonescriptphp-snippets"
