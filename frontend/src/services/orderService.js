import api from './api';

export const orderService = {
  createOrder: async (shippingAddress) => {
    const response = await api.post('/orders', { shippingAddress });
    return response.data;
  },

  getUserOrders: async () => {
    const response = await api.get('/orders');
    return response.data;
  },

  getOrderById: async (id) => {
    const response = await api.get(`/orders/${id}`);
    return response.data;
  },

  getAllOrders: async (page = 0, size = 10) => {
    const response = await api.get('/admin/orders', {
      params: { page, size }
    });
    return response.data;
  },

  updateOrderStatus: async (id, status) => {
    const response = await api.put(`/admin/orders/${id}/status`, null, {
      params: { status }
    });
    return response.data;
  },
};
