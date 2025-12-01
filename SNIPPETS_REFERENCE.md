# StoneScriptPHP Snippets Reference

Complete reference of all available snippets in the StoneScriptPHP VS Code extension.

## Routes

### `stone-route-get`
Creates a basic GET route extending BaseRoute.

**Output:**
- Namespace and imports
- Class extending BaseRoute
- process() method returning ApiResponse

**Use case:** Simple GET endpoints that return data

---

### `stone-route-post`
Creates a POST route with validation extending BaseRoute.

**Output:**
- Namespace and imports
- Class extending BaseRoute
- rules() method for validation
- process() method with validated input

**Use case:** POST endpoints that accept and validate user input

---

### `stone-route-contract`
Creates a route implementing IRouteHandler and a custom contract.

**Output:**
- Namespace and imports
- Class implementing IRouteHandler and custom contract
- validation_rules() method
- process() method that builds request DTO
- execute() method with business logic

**Use case:** Complex routes using DTOs and contracts for clean architecture

---

### `stone-route-health`
Creates a health check endpoint.

**Output:**
- Simple health check route
- Returns service status, timestamp, service name, and version

**Use case:** Microservice health monitoring

---

## Models

### `stone-model`
Creates a complete model class with a sample method.

**Output:**
- Namespace
- Class definition
- Static method that calls database function

**Use case:** Creating a new model class

---

### `stone-model-method`
Adds a generic method to a model.

**Output:**
- PHPDoc comment
- Static method with database call
- PDO fetch logic

**Use case:** Adding custom methods to existing models

---

### `stone-model-create`
Adds a create method for creating new entities.

**Output:**
- Create method with multiple parameters
- Database function call
- Returns created entity data

**Use case:** Adding create functionality to models

---

### `stone-model-get`
Adds a get method for retrieving entities by ID.

**Output:**
- Get method with ID parameter
- Database function call
- Returns entity or null

**Use case:** Adding read functionality to models

---

### `stone-model-update`
Adds an update method for modifying entities.

**Output:**
- Update method with ID and field parameters
- Database function call
- Returns updated entity data

**Use case:** Adding update functionality to models

---

### `stone-model-delete`
Adds a delete method for removing entities.

**Output:**
- Delete method with ID parameter
- Database function call
- Returns boolean success status

**Use case:** Adding delete functionality to models

---

## Contracts

### `stone-contract`
Creates a basic contract interface.

**Output:**
- Namespace
- Interface with execute method
- Request and Response DTO type hints

**Use case:** Simple contract for route logic

---

### `stone-contract-route`
Creates a route contract with full documentation.

**Output:**
- Namespace
- Interface for route contract
- PHPDoc comments
- execute method with typed DTOs

**Use case:** Defining route contracts with clear documentation

---

### `stone-contract-service`
Creates a service contract interface.

**Output:**
- Namespace
- Service interface
- Method with parameters and return type

**Use case:** Defining contracts for service layer

---

### `stone-contract-repository`
Creates a repository contract with CRUD operations.

**Output:**
- Namespace
- Repository interface
- findById, create, update, delete methods

**Use case:** Defining repository contracts for data access layer

---

## DTOs (Data Transfer Objects)

### `stone-dto-request`
Creates a request DTO class.

**Output:**
- Namespace
- Class with readonly properties
- Constructor with named parameters

**Use case:** Creating request DTOs for route input

---

### `stone-dto-response`
Creates a response DTO class.

**Output:**
- Namespace
- Class with readonly properties (typically includes id)
- Constructor with named parameters

**Use case:** Creating response DTOs for route output

---

### `stone-dto`
Creates a generic DTO class.

**Output:**
- Namespace
- Class with readonly properties
- Constructor with optional parameters

**Use case:** Creating any type of DTO

---

### `stone-dto-validated`
Creates a DTO with built-in validation.

**Output:**
- Namespace
- Class with readonly properties
- Constructor that calls validate()
- Private validate() method

**Use case:** DTOs that need to validate their data on construction

---

### `stone-dto-array-prop`
Adds an array property to a DTO.

**Output:**
- PHPDoc type annotation
- Readonly array property

**Use case:** Adding array properties to DTOs

---

### `stone-dto-nullable-prop`
Adds a nullable property to a DTO.

**Output:**
- Readonly nullable property with default null

**Use case:** Adding optional properties to DTOs

---

## Workflow Examples

### Creating a Complete Feature

1. **Define the contract:**
   ```
   stone-contract-route → IUsersRoute
   ```

2. **Create request/response DTOs:**
   ```
   stone-dto-request → CreateUserRequest
   stone-dto-response → CreateUserResponse
   ```

3. **Create the route:**
   ```
   stone-route-contract → UsersRoute
   ```

4. **Create the model:**
   ```
   stone-model → User
   stone-model-create → User::create()
   ```

### Quick API Endpoint

For simple endpoints without DTOs:

1. **GET endpoint:**
   ```
   stone-route-get → Simple data retrieval
   ```

2. **POST endpoint with validation:**
   ```
   stone-route-post → Data creation with validation
   ```

## Tips

- Use Tab to navigate between placeholders in snippets
- All snippets follow StoneScriptPHP conventions
- Snippets include proper PHPDoc comments
- Type hints are included for better IDE support
- Validation rules follow StoneScriptPHP syntax

## Customization

You can customize these snippets by:
1. Going to File > Preferences > User Snippets
2. Selecting "php.json"
3. Adding your customized versions

Or modify the extension directly in:
```
~/.vscode/extensions/progalaxy-elabs.stonescriptphp-snippets-1.0.0/snippets/
```
