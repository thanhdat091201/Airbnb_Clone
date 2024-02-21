import Navbar from "./Navbar";
import useLoginModal from "../../hooks/useLoginModal";
import { useContext } from "react";
import { UserContext } from "../../contexts/UserContext";
import { FaHouseMedical } from "react-icons/fa6"

const SetupHouse = () => {
  const loginModal = useLoginModal();
  const {user} = useContext(UserContext);

  const handleOnClick = () => {
    user ? alert("Hosting Open") : loginModal.toggle();
  }

  return (
    <>
      <Navbar 
        body={
          <div className="flex flex-row items-center font-semibold gap-5 ">
            <div>
              Ready to Airbnb it?
            </div>
            <button 
              onClick={handleOnClick}
              className="
                relative
                rounded-lg
                bg-gradient-to-r
                from-rose-500
                to-rose-600
                text-white
                text-lg
                p-3
              "
            >
              <div className="flex flex-row items-center gap-3">
                <FaHouseMedical size={18} color={"white"} />
                Airbnb Setup
              </div>
            </button>
          </div>
        }
        size={'medium'} 
      />
    </>
  )
}

export default SetupHouse