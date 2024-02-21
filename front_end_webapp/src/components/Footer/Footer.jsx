import InteractiveText from "../common/Button/InteractiveText";
import { TbWorld } from "react-icons/tb";
import { LuDollarSign } from "react-icons/lu";
import { MdOutlineKeyboardArrowUp } from "react-icons/md";
import { Container } from "../common/Container";
import useBottomModal from "../../hooks/useBottomModal";

const Footer = () => {
  const bottomModal = useBottomModal();

  return (
    <footer className="fixed bottom-0 w-full bg-white z-10 shadow-sm">
      <div className="py-3 border-t-[1px]">
        <Container>
          <div className="flex flex-row items-center justify-between">
            <div className="flex flex-wrap md:flex-row gap-3 md:gap-2 text-sm">
              <div className="p-0.5">
                © 2023 Airbnb, Inc.
              </div>
              <span>·</span>
              <InteractiveText
                label={'Terms'}
              />
              <span>·</span>
              <InteractiveText
                label={'Sitemap'}
              />
              <span>·</span>
              <InteractiveText
                label={'Privacy'}
              />
              <span>·</span>
              <InteractiveText
                label={'Your Privacy Choices'}
              />
              <span>·</span>
              <InteractiveText
                label={'Destinations'}
              />
            </div>
            <div className="flex flex-row gap-3 md:gap-4">
              <InteractiveText
                label={`English(US)`}
                IconFront={<TbWorld size={20}/>}
                onClick={() => {}}
                bold={true}
              />
              <InteractiveText
                label={`USD`}
                IconFront={<LuDollarSign size={15}/>}
                onClick={() => {}}
                bold={true}
              />
              <InteractiveText
                label={`Support & resources`}
                IconBack={<MdOutlineKeyboardArrowUp size={20}/>}
                onClick={bottomModal.toggle}
                bold={true}
              />
            </div>
          </div>
        </Container>
      </div>
    </footer>
  )
}

export default Footer;