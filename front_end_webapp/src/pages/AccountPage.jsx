import { useContext } from "react";
import Navbar from "../components/Header/Navbar";
import { UserMenu } from "../components/Header/UserMenu";
import { UserContext } from "../contexts/UserContext";
import { Navigate } from "react-router-dom";

const AccountPage = () => {
  const {ready,user} = useContext(UserContext);

  return (
    <>
      <Navbar
        body={<UserMenu />}
        size={'medium'}
        underline={true}
      />
      <div className="pt-20" >
        {user.name}
      </div>
    </>
  )
}

export default AccountPage;