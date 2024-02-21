import { create } from 'zustand';

const useBottomModal = create((set) => ({
  isOpen: false,
  toggle: () => set((state) => ({ isOpen: !state.isOpen }))
}));

export default useBottomModal


