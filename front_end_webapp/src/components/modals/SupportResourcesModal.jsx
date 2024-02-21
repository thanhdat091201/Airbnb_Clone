import BottomModal from "./BottomModal"
import useBottomModal from "../../hooks/useBottomModal";

const SupportResourcesModal = () => {
  const bottomModal = useBottomModal();

  return (
    <BottomModal
      isOpen={bottomModal.isOpen}
      onClose={bottomModal.toggle}
    />
  )
}

export default SupportResourcesModal;