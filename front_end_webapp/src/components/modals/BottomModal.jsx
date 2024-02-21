import { useCallback, useEffect, useState } from "react";
import { IoMdClose } from "react-icons/io";

const Modal = ({
  isOpen, 
  onClose,   
  disabled
}) => {
  const [showModal, setShowModal] = useState(isOpen);

  useEffect(() => {
    setShowModal(isOpen);
  }, [isOpen]);

  const handleClose = useCallback(() => {
    if (disabled) {
      return;
    }
  
    setShowModal(false);
    setTimeout(() => {
      onClose();
    }, 300)
  }, [onClose, disabled]);

  
  if (!isOpen) {
    return null;
  }

  return (
    <div
      className="
        justify-center 
        items-center 
        flex 
        overflow-x-hidden 
        overflow-y-auto 
        fixed 
        inset-0 
        z-50 
        outline-none 
        focus:outline-none
        bg-neutral-800/70
      "
    >
      <div className="
        w-full
        absolute
        inset-x-0 
        bottom-0
        "
      >
        {/*content*/}
        <div className={`
          translate
          duration-300
          h-full
          ${showModal ? 'translate-y-0' : 'translate-y-full'}
          ${showModal ? 'opacity-100' : 'opacity-0'}
        `}>
          <div className="
            translate
            h-full
            lg:h-auto
            md:h-auto
            border-0 
            rounded-t-lg 
            shadow-lg 
            relative 
            flex 
            flex-col 
            w-full 
            bg-white 
            outline-none 
            focus:outline-none
          "
          >
            {/*header*/}
            <div className="
              flex 
              items-center
              mt-3
              md:p-4 
              xl:p-5
              rounded-t
              justify-center
              relative
              "
            >
              <button
                className="
                  bg-transparent
                  p-1.5
                  border-0 
                  hover:opacity-70
                  hover:bg-neutral-200 rounded-full
                  hover:
                  transition
                  absolute
                  left-5
                "
                onClick={handleClose}
              >
                <IoMdClose size={18} />
              </button>
              <div className="text-lg font-semibold">
              </div>
            </div>
            {/*body*/}
            <div className="relative p-6 flex-auto">
              body
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Modal;