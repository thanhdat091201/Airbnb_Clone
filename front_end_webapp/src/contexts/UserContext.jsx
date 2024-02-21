import axios from "axios";
import { createContext, useState, useEffect } from "react";

export const UserContext = createContext({});

export const UserContextProvider = ({children}) => {
  const [user,setUser] = useState(null);
  const [ready,setReady] = useState(false);
  useEffect(() => {
    if (!user || typeof user !== 'object') {
      axios.get('/profile').then(({data}) => {
        setUser(data);
        setReady(true);
      });
    }
  }, [user]);
  console.log(user)
  return (
    <UserContext.Provider value={{user,setUser,ready}}>
      {children}
    </UserContext.Provider>
  );  
}

