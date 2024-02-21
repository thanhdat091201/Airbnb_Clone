import { create } from 'zustand';

const useRegisterModal = create((set) => ({
  isOpen: false,
  toggle: () => set((state) => ({ isOpen: !state.isOpen }))
}));

export default useRegisterModal