import { Link } from 'react-router-dom';

const AdminDashboard = () => {
  return (
    <div className="min-h-screen bg-gray-50">
      <div className="container mx-auto px-4 py-8">
        <h1 className="text-3xl font-bold mb-8">Admin Dashboard</h1>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <Link
            to="/admin/products"
            className="bg-white rounded-lg shadow-md p-8 hover:shadow-xl transition-shadow"
          >
            <div className="text-4xl mb-4">📦</div>
            <h2 className="text-2xl font-bold mb-2">Products</h2>
            <p className="text-gray-600">Manage product inventory</p>
          </Link>

          <Link
            to="/admin/orders"
            className="bg-white rounded-lg shadow-md p-8 hover:shadow-xl transition-shadow"
          >
            <div className="text-4xl mb-4">🛒</div>
            <h2 className="text-2xl font-bold mb-2">Orders</h2>
            <p className="text-gray-600">View and manage orders</p>
          </Link>

          <Link
            to="/admin/users"
            className="bg-white rounded-lg shadow-md p-8 hover:shadow-xl transition-shadow"
          >
            <div className="text-4xl mb-4">👥</div>
            <h2 className="text-2xl font-bold mb-2">Users</h2>
            <p className="text-gray-600">Manage user accounts</p>
          </Link>
        </div>

        <div className="mt-12 bg-white rounded-lg shadow-md p-6">
          <h2 className="text-xl font-bold mb-4">Quick Actions</h2>
          <div className="flex flex-wrap gap-4">
            <Link
              to="/admin/products/add"
              className="px-6 py-3 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
            >
              Add New Product
            </Link>
            <Link
              to="/products"
              className="px-6 py-3 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300"
            >
              View Store
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminDashboard;
