import api from './api';

export const userService = {
  getAllUsers: async (page = 0, size = 10) => {
    const response = await api.get('/admin/users', {
      params: { page, size }
    });
    return response.data;
  },

  getUserById: async (id) => {
    const response = await api.get(`/admin/users/${id}`);
    return response.data;
  },

  deleteUser: async (id) => {
    const response = await api.delete(`/admin/users/${id}`);
    return response.data;
  },
};
