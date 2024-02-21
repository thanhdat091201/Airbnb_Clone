import LoginModal from "./components/modals/LoginModal";
import RegisterModal from "./components/modals/RegisterModal";
import SupportResourcesModal from "./components/modals/SupportResourcesModal";
import { Outlet } from "react-router-dom";

export default function Layout() {
  return (
    <>
      <LoginModal />
      <RegisterModal />
      <SupportResourcesModal />
      <Outlet/>
    </>
  );
}