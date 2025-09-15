# Daily Planner Backend

A robust Rails API backend for a daily planner application, featuring user authentication, event management, and comprehensive CRUD operations.

## 🚀 Features

### Authentication & Authorization
- **JWT-based Authentication** - Secure token-based authentication system
- **User Registration** - New user account creation with email validation
- **User Login** - Secure login with password authentication
- **Protected Routes** - JWT middleware for securing API endpoints
- **Password Security** - Bcrypt hashing for secure password storage

### Event Management (CRUD Operations)
- **Create Events** - Add new events with full details
- **Read Events** - Retrieve events with filtering capabilities
- **Update Events** - Modify existing event details
- **Delete Events** - Remove events from the system
- **Event Filtering** - Filter events by date, month, and year
- **User-specific Events** - Each user can only access their own events

### Event Features
- **Rich Event Data** - Title, description, date, time, category, and priority
- **Event Categories** - Work, Personal, Health, Other
- **Priority Levels** - Low, Medium, High priority classification
- **Date & Time Support** - Full date and time scheduling
- **Data Validation** - Comprehensive validation for all event fields

### API Features
- **RESTful API Design** - Clean, consistent API endpoints
- **JSON API Responses** - Structured JSON responses using Blueprinter
- **CORS Support** - Cross-origin resource sharing enabled
- **Error Handling** - Comprehensive error responses and status codes
- **API Versioning** - Versioned API endpoints (v1)

## 🛠 Tech Stack

- **Ruby on Rails 8.0.2** - Web application framework
- **PostgreSQL** - Primary database
- **JWT** - JSON Web Token authentication
- **Bcrypt** - Password hashing
- **Blueprinter** - JSON serialization
- **Rack-CORS** - Cross-origin resource sharing
- **Puma** - Web server
- **Solid Cache/Queue/Cable** - Rails 8 solid adapters

## 📋 API Endpoints

### Authentication
```
POST /api/v1/register    # User registration
POST /api/v1/login       # User login
GET  /api/v1/protected   # Test protected route
```

### Events
```
GET    /api/v1/events           # List all user events
POST   /api/v1/events           # Create new event
GET    /api/v1/events/:id       # Get specific event
PUT    /api/v1/events/:id       # Update event
DELETE /api/v1/events/:id       # Delete event
```

### Query Parameters for Events
- `date` - Filter events by specific date
- `month` & `year` - Filter events by month/year

## 🗄 Database Schema

### Users Table
- `id` - Primary key
- `email` - Unique email address
- `password_digest` - Hashed password
- `created_at`, `updated_at` - Timestamps

### Events Table
- `id` - Primary key
- `title` - Event title (required)
- `description` - Event description
- `date` - Event date (required)
- `time` - Event time
- `category` - Event category (Work/Personal/Health/Other)
- `priority` - Event priority (Low/Medium/High)
- `user_id` - Foreign key to users table
- `created_at`, `updated_at` - Timestamps

## 🚀 Setup & Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd daily-planner-backend
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Database setup**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

The API will be available at `http://localhost:3001`

## 🔐 Authentication Flow

1. **Register** a new user via `POST /api/v1/register`
2. **Login** with credentials via `POST /api/v1/login`
3. **Use the JWT token** in the Authorization header: `Bearer <token>`
4. **Access protected routes** with the token

## 📝 Example API Usage

### Register User
```bash
curl -X POST http://localhost:3001/api/v1/register \
  -H "Content-Type: application/json" \
  -d '{"auth": {"email": "user@example.com", "password": "password", "password_confirmation": "password"}}'
```

### Login
```bash
curl -X POST http://localhost:3001/api/v1/login \
  -H "Content-Type: application/json" \
  -d '{"auth": {"email": "user@example.com", "password": "password"}}'
```

### Create Event
```bash
curl -X POST http://localhost:3001/api/v1/events \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your-jwt-token>" \
  -d '{"event": {"title": "Meeting", "description": "Team standup", "date": "2024-01-15", "time": "09:00", "category": "Work", "priority": "High"}}'
```

## 🧪 Testing

Run the test suite:
```bash
rails test
```

## 📦 Dependencies

Key gems used in this project:
- `rails` - Web framework
- `pg` - PostgreSQL adapter
- `bcrypt` - Password hashing
- `jwt` - JSON Web Token
- `blueprinter` - JSON serialization
- `rack-cors` - CORS handling
- `puma` - Web server

## 🚀 Deployment

This application is configured for deployment with:
- **Kamal** - Zero-downtime deployments
- **Docker** - Containerization support
- **Thruster** - HTTP asset caching and compression

## 📄 License

[Add your license information here]

---

Built with ❤️ using Ruby on Rails