export const MenuItem = ({ onClick, label, small }) => {
  return (
    <button 
      onClick={onClick} 
      className={`
        text-left	
        px-4 
        py-3 
        hover:bg-neutral-100 
        transition
        font-semibold
        ${small ? '' : 'text-gray-500'}
        `
      }
    >
      {label}
    </button>
  )
}