#!/bin/bash
# Create a simple extension icon using ImageMagick

if ! command -v convert &> /dev/null; then
    echo "ImageMagick not installed. Install with: sudo apt install imagemagick"
    echo ""
    echo "Alternative: Create icon manually at https://www.canva.com"
    echo "  Size: 128x128 pixels"
    echo "  Save as: icon.png"
    exit 1
fi

# Create a simple StoneScriptPHP icon
convert -size 128x128 xc:"#00D9FF" \
  -gravity center \
  -pointsize 80 \
  -font "DejaVu-Sans-Bold" \
  -fill white \
  -annotate +0+0 "S" \
  icon.png

echo "✓ Icon created: icon.png"
ls -lh icon.png
