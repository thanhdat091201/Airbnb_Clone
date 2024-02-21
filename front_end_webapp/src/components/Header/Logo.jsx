import { Link } from 'react-router-dom';

export const Logo = () => {
  return (
    <Link to="/">
      <img 
        onClick={() => {}}
        src={'./images/logo.png'} 
        className="hidden object-contain md:block cursor-pointer"
        height={100}
        width={100}
        alt="logo"
      />
    </Link>
  )
}