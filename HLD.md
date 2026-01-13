# vscode-stonescriptphp - High Level Design

## Overview
VS Code extension providing code snippets for StoneScriptPHP framework development.

## Features
- Code snippets for routes (GET, POST, with contracts, health checks)
- Code snippets for models (CRUD operations)
- Code snippets for contracts (interfaces)
- Code snippets for DTOs (Data Transfer Objects - request, response, validated)

## Architecture
Simple VS Code snippets extension with no custom TypeScript code. Uses JSON snippet files to provide IntelliSense and autocomplete functionality.

## Tech Stack
- JSON (snippet definitions)
- VS Code Extension API (via package.json manifest)
- No custom code - pure snippet-based extension

## Snippet Categories
- `snippets/routes.json` - Route snippets
- `snippets/models.json` - Model snippets
- `snippets/contracts.json` - Contract snippets
- `snippets/dto.json` - DTO snippets

## Distribution
- Published to VS Code Marketplace as "stonescriptphp-snippets"
- GitHub repository for open source contributions at https://github.com/progalaxyelabs/vscode-stonescriptphp
