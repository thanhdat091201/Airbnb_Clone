import './App.css'
import axios from "axios";
import {Route, Routes} from "react-router-dom";
import {UserContextProvider} from "./contexts/UserContext";
import Layout from "./Layout";
import IndexPage from "./pages/IndexPage.jsx";
import HostHomePage from "./pages/HostHomePage";
import AccountPage from './pages/AccountPage';

axios.defaults.baseURL = 'http://127.0.0.1:4000';
// axios.defaults.baseURL = import.meta.env.VITE_API_BASE_URL;
axios.defaults.withCredentials = true;

function App() {
  return (
    <UserContextProvider>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<IndexPage />} />
          <Route path="/host" element={<HostHomePage />} />
          <Route path="/account" element={<AccountPage />} />
        </Route>
      </Routes>
    </UserContextProvider>
  )
}

export default App