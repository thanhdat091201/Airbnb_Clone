import { useState } from "react";
import { Container } from "../components/common/Container"
import { MdKeyboardArrowUp, MdKeyboardArrowDown } from "react-icons/md"
import SetupHouse from "../components/Header/SetupHouse"
import Footer from "../components/Footer/Footer";

const HostHomePage = () => {

  const initialItems = [
    {
      title: "Is my place right for Airbnb?",
      body: "Airbnb guests are interested in all kinds of places. We have listings for tiny homes, cabins, treehouses, and more. Even a spare room can be a great place to stay.",
    },
    {
      title: "Do I have to host all the time?",
      body: "Not at all-you control your calendar. You can host once a year, a few nights a month, or more often.",
    },
    {
      title: "How much should I interact with guests?",
      body: "It’s up to you. Some Hosts prefer to message guests only at key moments—like sending a short note when they check in—while others also enjoy meeting their guests in person. You’ll find a style that works for you and your guests.",
    },
    {
      title: "Any tips on being a great Airbnb Host?",
      body: "Getting the basics down goes a long way. Keep your place clean, respond to guests promptly, and provide necessary amenities, like fresh towels. Some Hosts like adding a personal touch, such as putting out fresh flowers or sharing a list of local places to explore—but it’s not required.",
    },
    {
      title: "What are Airbnb’s fees?",
      body: "Airbnb typically collects a flat service fee of 3% of the reservation subtotal when you get paid. We also collect a fee from guests when they book. In many areas, Airbnb collects and pays sales and tourism taxes automatically on your behalf as well.",
    },
  ];

  const [isCollapsed, setIsCollapsed] = useState(
    initialItems.map(() => false)
  )

  const toggleCollapse = (index) => {
    const updatedStates = [...isCollapsed];
    updatedStates[index] = !updatedStates[index];
    setIsCollapsed(updatedStates);
  };

  return (
    <>
      <SetupHouse />
      <div className="pt-44 pb-20">
        <img 
          src={'./images/easily-setup.png'} 
          className="w-100vh md:block hidden overflow-hidden"
          alt="img"
        />
        <Container>
          <div className="flex flex-row justify-around mt-[-50px] pb-10">
            <div className="text-neutral-500">
              <h1 className="text-black font-semibold text-lg">One-to-one guidance from a Superhost</h1>
              We’ll match you with a Superhost in your area, who’ll guide you from your first question to your first guest—by phone, video call, or chat.
            </div>
            <div className="text-neutral-500">
              <h1 className="text-black font-semibold text-lg">An experienced guest for your first booking</h1>
              For your first booking, you can choose to welcome an experienced guest who has at least three stays and a good track record on Airbnb.
            </div>
            <div className="text-neutral-500">
              <h1 className="text-black font-semibold text-lg">Specialized support from Airbnb</h1>
              New Hosts get one-tap access to specially trained Community Support agents who can help with everything from account issues to billing support.
            </div>
          </div>
        </Container>
        <div className="bg-neutral-100">
          <Container>
            <div className="flex flex-row gap-4">
              <div className="font-semibold w-1/2 p-4 text-[60px]">
                Your questions,
                answered
              </div>
              <div className="w-1/2 p-4">
                {initialItems.map((item, index) => (
                  <div key={index}>
                    <div className="p-3">
                      <button
                        className="py-2 text-2xl text-neutral-800 w-full"
                        onClick={() => toggleCollapse(index)}
                      >
                        <div className="flex flex-row items-center justify-between">
                          <span>{item.title}</span>
                          {!isCollapsed[index] ? <MdKeyboardArrowUp/> : <MdKeyboardArrowDown />}
                        </div>
                      </button>
                      <div
                        className={`transition-max-height duration-300 delay-75 ease-in-out overflow-hidden ${
                          !isCollapsed[index] ? 'max-h-0' : 'max-h-screen'
                        }`}
                      >
                        <div className="py-3 text-lg text-neutral-500">
                          {item.body}
                        </div>
                      </div>
                    </div>
                    {index !== initialItems.length - 1 && <hr className="border border-neutral-300" />}
                  </div>
                ))}
              </div>
            </div>
          </Container>
        </div>
      </div>
      <Footer />
    </>
  )
}

export default HostHomePage
