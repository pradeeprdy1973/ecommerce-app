# E-Commerce Backend API

A full-stack E-Commerce Backend application built using Java, Spring Boot, Spring Security, JWT Authentication, and MySQL.  
This project provides secure REST APIs for user authentication, product management, cart handling, and order processing.

---

# Features

- User Registration & Login
- JWT Authentication & Authorization
- Role-Based Access (ADMIN / USER)
- Product Management
- Shopping Cart System
- Order Management
- Product Search & Filtering
- Pagination Support
- Swagger API Documentation
- Exception Handling
- MySQL Database Integration

---

# Tech Stack

## Backend
- Java 21
- Spring Boot 3.2.3
- Spring Security
- JWT Authentication
- Spring Data JPA
- Hibernate
- Maven

## Database
- MySQL

## API Testing
- Postman
- Swagger UI

---

# Project Structure

ecommerce-backend/
│
├── src/main/java/com/ecommerce/
│   ├── config/
│   ├── controller/
│   ├── dto/
│   ├── entity/
│   ├── exception/
│   ├── repository/
│   ├── security/jwt/
│   ├── service/
│   └── EcommerceApplication.java
│
├── src/main/resources/
│   ├── application.properties
│   └── schema.sql
│
├── pom.xml
└── README.md

---

# Prerequisites

Install the following before running the project:

- Java 21
- Maven
- MySQL Server
- Git
- VS Code / STS / IntelliJ

---

# Database Setup

## Step 1: Create Database

Open MySQL and run:

CREATE DATABASE ecommerce_db;

---

## Step 2: Configure Database

Update `src/main/resources/application.properties`

spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce_db?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC

spring.datasource.username=root
spring.datasource.password=your_mysql_password

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

---

# JWT Configuration

Add JWT secret key inside `application.properties`

jwt.secret=MySecretKey123456789
jwt.expiration=86400000

---

# Run Backend Project

## Clone Repository

git clone https://github.com/your-username/ecommerce-backend.git

## Navigate to Project

cd ecommerce-backend

## Install Dependencies

mvn clean install

## Run Application

mvn spring-boot:run

Backend runs at:

http://localhost:8080

---

# Swagger API Documentation

After running the project:

## Swagger UI

http://localhost:8080/swagger-ui.html

## API Docs

http://localhost:8080/v3/api-docs

---

# API Endpoints

## Authentication APIs

| Method | Endpoint | Description |
|---|---|---|
| POST | /api/auth/register | Register User |
| POST | /api/auth/login | Login User |

---

## Product APIs

| Method | Endpoint | Description |
|---|---|---|
| GET | /api/products | Get All Products |
| GET | /api/products/{id} | Get Product By ID |
| GET | /api/products/search | Search Products |

---

## Cart APIs

| Method | Endpoint | Description |
|---|---|---|
| GET | /api/cart | View Cart |
| POST | /api/cart/add | Add Product to Cart |
| DELETE | /api/cart/items/{id} | Remove Cart Item |

---

## Order APIs

| Method | Endpoint | Description |
|---|---|---|
| POST | /api/orders | Create Order |
| GET | /api/orders | Order History |

---

## Admin APIs

| Method | Endpoint | Description |
|---|---|---|
| POST | /api/admin/products | Add Product |
| PUT | /api/admin/products/{id} | Update Product |
| DELETE | /api/admin/products/{id} | Delete Product |

---

# Default Admin Credentials

Email: admin@ecommerce.com  
Password: admin123

---

# Testing Using Postman

## Register User

POST /api/auth/register

{
  "name": "Pradeep",
  "email": "pradeep@gmail.com",
  "password": "password123"
}

---

## Login User

POST /api/auth/login

{
  "email": "pradeep@gmail.com",
  "password": "password123"
}

Copy JWT token from response.

---

## Authorization Header

Authorization: Bearer your_token_here

---

# Deployment

## Backend Deployment Platforms

- Render
- Railway
- Heroku
- AWS
- Azure

---

# Common Errors & Solutions

## JWT_SECRET Error

Add this in `application.properties`

jwt.secret=MySecretKey123456789

---

## Port Already Running

Change server port:

server.port=8081

---

## MySQL Connection Error

- Check MySQL service is running
- Verify username & password
- Ensure database exists

---

# Future Enhancements

- Payment Gateway Integration
- Email Notifications
- Product Image Upload
- Wishlist Feature
- Admin Dashboard
- Docker Deployment

---

# Author

Pradeep

Java Full Stack Developer

---

# License

This project is developed for educational and learning purposes.
