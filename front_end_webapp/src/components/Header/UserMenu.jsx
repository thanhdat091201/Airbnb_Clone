import { useState, useCallback, useContext } from "react"
import { AiOutlineMenu } from "react-icons/ai";
import { TbWorld } from "react-icons/tb";
import { Avatar } from "../common/Avatar"
import { MenuItem } from "./MenuItem"
import { UserContext } from "../../contexts/UserContext";
import { Link } from "react-router-dom";
import useLoginModal from "../../hooks/useLoginModal";
import useRegisterModal from "../../hooks/useRegisterModal";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export const UserMenu = () => {
  const loginModal = useLoginModal();
  const registerModal = useRegisterModal();
  const navigate = useNavigate();
  const {user} = useContext(UserContext);
  const [isOpen, setIsOpen] = useState(false);

  const toggleOpen = useCallback(() => {
    setIsOpen((value) => !value);
  }, []);

  const handleOnClick = (func) => {
    toggleOpen();
    func();
  }

  const handleLoggout = () => {
    axios.get('/loggout')
    .then((response) => {
      response.data.Status === "Success" ?
      // setUser(null) : alert("Error")
      location.reload(true) : alert("Error")
    })
    .catch((err) => {
      throw new Error(err.message);
    })
  }

  return (
    <div className="relative">
      <div className="flex flex-row items-center gap-2">
        <Link to={'/host'}
          // onClick={}
          className="
            hidden
            md:block
            text-sm 
            font-semibold 
            py-3 
            px-4 
            rounded-full 
            hover:bg-neutral-100 
            transition 
            cursor-pointer
          "
        >
          Airbnb your home
        </Link>
        <div 
          // onClick={}
          className="
            hidden
            lg:block
            py-3 
            px-3 
            rounded-full 
            hover:bg-neutral-100 
            transition 
            cursor-pointer
          "
        >
          <TbWorld className="text-gray-700" size={20} />
        </div>
        <div 
        onClick={toggleOpen}
        className="
          p-4
          md:py-2
          md:px-3
          border-[1px] 
          border-neutral-200 
          flex 
          flex-row 
          items-center 
          gap-3 
          rounded-full 
          cursor-pointer 
          hover:shadow-md 
          transition
          "
        >
          <AiOutlineMenu />
          <div className="hidden md:block">
            <Avatar  />
          </div>
        </div>
      </div>
      {isOpen && (
        <div 
          className="
            absolute 
            rounded-xl 
            shadow-md
            w-[40vw]
            md:w-3/4 
            bg-white 
            overflow-hidden 
            right-0 
            top-12 
            text-sm
            z-10
          "
        >
          <div className="flex flex-col cursor-pointer">
            {user ? (
              <>
                <MenuItem 
                  label="Messages" 
                  onClick={() => {}}
                  small={true}
                />
                <MenuItem 
                  label="Trips" 
                  onClick={() => {}}
                  small={true}
                />
                <MenuItem 
                  label="Wishlists" 
                  onClick={() => {}}
                  small={true}
                />
                <hr/>
                <MenuItem 
                  label="Airbnb your home" 
                  onClick={() => {}}
                />
                <MenuItem 
                  label="Refer a Host" 
                  onClick={() => {}}
                />
                <MenuItem 
                  label="Account" 
                  onClick={() => {navigate("/account")}}
                />
                <hr />
                <MenuItem 
                  label="Help" 
                  onClick={() => {}}
                />
                <MenuItem 
                  label="Logout" 
                  onClick={handleLoggout}
                />
              </>
            ) : (
              <>
                <MenuItem 
                  label="Login" 
                  onClick={() => {handleOnClick(loginModal.toggle)}}
                  small={true}
                />
                <MenuItem 
                  label="Sign up" 
                  onClick={() => {handleOnClick(registerModal.toggle)}}
                />
                <hr />
                <MenuItem 
                  label="Airbnb your home" 
                  onClick={() => {}}
                />
                <MenuItem 
                  label="Help" 
                  onClick={toggleOpen}
                />
              </>
            )}
          </div>
        </div>
      )}
    </div>
  )
}