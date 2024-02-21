import { useState } from 'react';
import { BsFillMapFill } from 'react-icons/bs'
import { FaListUl } from 'react-icons/fa'
import Footer from "../components/Footer/Footer"
import MapBox from '../components/Map/MapBox';
import Navbar from "../components/Header/Navbar";
import { Search } from "../components/Header/Search.jsx";
import { UserMenu } from "../components/Header/UserMenu.jsx";

export default function IndexPage() {
  const [isOpen, setIsOpen] = useState(true);
  return (
    <>
      <Navbar 
        body={
          <>
            <Search />
            <UserMenu />
          </>
        }
        size={'small'}
        showCategory={true}
        underline={true}
      />
      <div className="pt-44">
        <div className="flex justify-center items-center">
          <button className='
            fixed
            z-10
            py-3
            px-4
            justify-center
            bg-black
            rounded-full
            bottom-20
          '
          onClick={() => setIsOpen(!isOpen)}
          >
            <div className="
              flex
              flex-row
              items-center
              gap-2
              text-white
              text-sm
              font-semibold
            ">
              {isOpen ? (
                <>
                  Show map
                  <BsFillMapFill size={13} color="white" />
                </>
              ) : (
                <>
                  Show list
                  <FaListUl size={15} color="white" />
                </>
              )}
            </div>
          </button>
        </div>  
        <div className={`w-full w-screen ${isOpen ? 'invisible' : ' '} `}>
          <MapBox />
        </div>
        {isOpen && (<Footer />)}
      </div>
    </>
  );
}

