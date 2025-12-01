# StoneScriptPHP Snippets

VS Code extension providing code snippets for the StoneScriptPHP framework.

## Features

This extension provides a comprehensive set of code snippets for StoneScriptPHP development, including:

### Routes
- `stone-route-get` - Create a GET route extending BaseRoute
- `stone-route-post` - Create a POST route with validation
- `stone-route-contract` - Create a route implementing a contract
- `stone-route-health` - Create a health check route

### Models
- `stone-model` - Create a model class
- `stone-model-method` - Add a method to a model
- `stone-model-create` - Add a create method
- `stone-model-get` - Add a get method
- `stone-model-update` - Add an update method
- `stone-model-delete` - Add a delete method

### Contracts
- `stone-contract` - Create a contract interface
- `stone-contract-route` - Create a route contract
- `stone-contract-service` - Create a service contract
- `stone-contract-repository` - Create a repository contract

### DTOs (Data Transfer Objects)
- `stone-dto-request` - Create a request DTO
- `stone-dto-response` - Create a response DTO
- `stone-dto` - Create a generic DTO
- `stone-dto-validated` - Create a DTO with validation
- `stone-dto-array-prop` - Add an array property
- `stone-dto-nullable-prop` - Add a nullable property

## Usage

1. Install the extension
2. Open a PHP file
3. Start typing a snippet prefix (e.g., `stone-route-get`)
4. Press `Tab` or `Enter` to insert the snippet
5. Use `Tab` to navigate between placeholders

## Examples

### Creating a GET Route

Type `stone-route-get` and press Enter:

```php
<?php

namespace App\Routes;

use Framework\Routing\BaseRoute;
use Framework\Http\ApiResponse;

/**
 * RouteDescription
 *
 * Usage:
 *   GET http://localhost:9100/endpoint
 */
class RouteNameRoute extends BaseRoute
{
    /**
     * Process the request
     */
    public function process(): ApiResponse
    {
        // Your logic here

        return new ApiResponse('ok', 'Success message', [
            // Your data here
        ]);
    }
}
```

### Creating a Model

Type `stone-model` and press Enter:

```php
<?php

namespace App\Models;

/**
 * ModelName Model
 *
 * Model description
 */
class ModelName
{
    /**
     * Method description
     *
     * @param string $param1 Parameter description
     * @return array Return description
     */
    public static function methodName(string $param1): array
    {
        global $db;

        $stmt = $db->prepare('SELECT * FROM function_name($1)');
        $stmt->execute([$param1]);

        return $stmt->fetch(\PDO::FETCH_ASSOC) ?: [];
    }
}
```

## Requirements

- VS Code 1.80.0 or higher
- PHP development environment

## About StoneScriptPHP

StoneScriptPHP is a lightweight PHP framework designed for building modern APIs with a focus on simplicity and performance.

## Contributing

Contributions are welcome! Please visit the [GitHub repository](https://github.com/progalaxy-elabs/stonescriptphp) to report issues or submit pull requests.

## License

MIT License - See LICENSE file for details

## Release Notes

### 1.0.0

Initial release with snippets for:
- Routes (GET, POST, with contracts, health checks)
- Models (CRUD operations)
- Contracts (interfaces)
- DTOs (request, response, validated)
