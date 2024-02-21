import { Container } from "../common/Container.jsx";
import { Logo } from "./Logo.jsx";
import { Categories } from "./Categories.jsx";

export default function Navbar({
  body,
  size,
  showCategory,
  underline
}) {
  return (
    <div className={`fixed w-full bg-white z-10 ${underline ? 'shadow-sm' : ''}`}>
      <div className={`py-4 ${underline ? 'border-b-[1px]' : ''}`}>
        <Container size={size}>
          <div className="flex flex-row items-center justify-between gap-3 md:gap-0">
            <Logo />
            {body}
          </div>
        </Container>
      </div>
      {showCategory && (
        <Categories />
      )}
    </div>
  )
}
