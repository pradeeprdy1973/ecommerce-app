# E-Commerce Frontend - React + Vite

Modern, responsive e-commerce web application built with React 18, Vite, Tailwind CSS, and Axios.

## Features

- Modern, Amazon-like UI design
- User authentication (login/register)
- Product browsing with search and filters
- Shopping cart functionality
- Order management
- Admin dashboard for product/order/user management
- Responsive design for mobile and desktop
- Real-time notifications with React Toastify
- Protected routes for authenticated users
- Role-based access control

## Tech Stack

- React 18
- Vite
- React Router DOM v6
- Axios for API calls
- Tailwind CSS for styling
- React Toastify for notifications

## Prerequisites

- Node.js 16.0 or higher
- npm or yarn
- Backend API running on http://localhost:8080

## Installation & Running

### 1. Navigate to the frontend directory
```bash
cd ecommerce-frontend
```

### 2. Install dependencies
```bash
npm install
```

### 3. Start the development server
```bash
npm run dev
```

The application will start on `http://localhost:5173`

### 4. Build for production
```bash
npm run build
```

### 5. Preview production build
```bash
npm run preview
```

## Project Structure

```
ecommerce-frontend/
├── src/
│   ├── assets/              # Static assets
│   ├── components/          # Reusable components
│   │   ├── Navbar.jsx
│   │   ├── Footer.jsx
│   │   ├── ProductCard.jsx
│   │   ├── Pagination.jsx
│   │   ├── LoadingSpinner.jsx
│   │   └── ProtectedRoute.jsx
│   ├── context/             # React Context
│   │   └── AuthContext.jsx
│   ├── pages/               # Page components
│   │   ├── Home.jsx
│   │   ├── Products.jsx
│   │   ├── ProductDetails.jsx
│   │   ├── Cart.jsx
│   │   ├── Checkout.jsx
│   │   ├── Orders.jsx
│   │   ├── Login.jsx
│   │   ├── Register.jsx
│   │   └── admin/          # Admin pages
│   │       ├── AdminDashboard.jsx
│   │       ├── AdminProducts.jsx
│   │       ├── ProductForm.jsx
│   │       ├── AdminOrders.jsx
│   │       └── AdminUsers.jsx
│   ├── services/            # API services
│   │   ├── api.js
│   │   ├── authService.js
│   │   ├── productService.js
│   │   ├── cartService.js
│   │   ├── orderService.js
│   │   └── userService.js
│   ├── App.jsx              # Main app component
│   ├── main.jsx             # Entry point
│   └── index.css            # Global styles
├── index.html
├── package.json
├── vite.config.js
├── tailwind.config.js
└── README.md
```

## Features Overview

### User Features
- **Home Page**: Hero section, featured products, and categories
- **Products Page**: Browse all products with search, filter, and pagination
- **Product Details**: View detailed product information and add to cart
- **Shopping Cart**: Manage cart items, update quantities, view total
- **Checkout**: Enter shipping address and place orders
- **Orders**: View order history with status tracking
- **Authentication**: Secure login and registration

### Admin Features
- **Admin Dashboard**: Overview with quick access to management sections
- **Product Management**: Create, edit, and delete products
- **Order Management**: View all orders and update order status
- **User Management**: View and manage user accounts

## Environment Configuration

The frontend is configured to connect to the backend at `http://localhost:8080`.

To change the API base URL, edit `src/services/api.js`:
```javascript
const API_BASE_URL = 'http://localhost:8080/api';
```

## Default Credentials

### Admin Account
- Email: `admin@ecommerce.com`
- Password: `admin123`

### Test User
You can register a new user account via the registration page.

## Available Routes

### Public Routes
- `/` - Home page
- `/products` - Product listing
- `/products/:id` - Product details
- `/login` - Login page
- `/register` - Registration page

### Protected User Routes
- `/cart` - Shopping cart
- `/checkout` - Checkout page
- `/orders` - Order history

### Protected Admin Routes
- `/admin` - Admin dashboard
- `/admin/products` - Product management
- `/admin/products/add` - Add new product
- `/admin/products/edit/:id` - Edit product
- `/admin/orders` - Order management
- `/admin/users` - User management

## Key Components

### AuthContext
Manages user authentication state and provides:
- `login(email, password)` - Login user
- `register(name, email, password)` - Register new user
- `logout()` - Logout user
- `isAuthenticated()` - Check if user is authenticated
- `isAdmin()` - Check if user has admin role

### ProtectedRoute
Wrapper component for routes that require authentication:
```jsx
<ProtectedRoute adminOnly>
  <AdminDashboard />
</ProtectedRoute>
```

## API Services

All API calls are centralized in the `services` directory:

- **authService**: Authentication operations
- **productService**: Product CRUD operations
- **cartService**: Shopping cart operations
- **orderService**: Order management
- **userService**: User management (admin)

Each service uses Axios with automatic JWT token injection.

## Styling

The application uses Tailwind CSS with a custom color scheme:

- Primary color: Orange (#f97316)
- Background: Gray-50
- Cards: White with shadow
- Hover effects on all interactive elements

## Troubleshooting

### Port Already in Use
If port 5173 is in use, Vite will automatically try the next available port or you can specify one:
```bash
npm run dev -- --port 3000
```

### API Connection Issues
- Ensure the backend is running on http://localhost:8080
- Check browser console for CORS errors
- Verify JWT token in localStorage

### Build Errors
```bash
# Clear node_modules and reinstall
rm -rf node_modules
npm install
```

## Performance Optimizations

- Lazy loading for images
- React Router code splitting
- Pagination for large datasets
- Optimized bundle size with Vite
- Cached API responses where appropriate

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## License

MIT License
