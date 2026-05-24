import api from './api';

export const productService = {
  getAllProducts: async (page = 0, size = 12, sortBy = 'createdAt', sortDir = 'desc') => {
    const response = await api.get('/products', {
      params: { page, size, sortBy, sortDir }
    });
    return response.data;
  },

  searchProducts: async (keyword = '', category = '', page = 0, size = 12) => {
    const response = await api.get('/products/search', {
      params: { keyword, category, page, size }
    });
    return response.data;
  },

  getProductById: async (id) => {
    const response = await api.get(`/products/${id}`);
    return response.data;
  },

  createProduct: async (productData) => {
    const response = await api.post('/admin/products', productData);
    return response.data;
  },

  updateProduct: async (id, productData) => {
    const response = await api.put(`/admin/products/${id}`, productData);
    return response.data;
  },

  deleteProduct: async (id) => {
    const response = await api.delete(`/admin/products/${id}`);
    return response.data;
  },
};
