import { create } from 'zustand';

const useFiltersModal = create((set) => ({
  isOpen: false,
  toggle: () => set((state) => ({ isOpen: !state.isOpen }))
}));

export default useFiltersModal


