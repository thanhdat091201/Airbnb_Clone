import { create } from 'zustand';

const useLoginModal = create((set) => ({
  isOpen: false,
  toggle: () => set((state) => ({ isOpen: !state.isOpen }))
}));

export default useLoginModal


