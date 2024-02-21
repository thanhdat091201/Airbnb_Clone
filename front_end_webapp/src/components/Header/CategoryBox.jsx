export const CategoryBox = ({
   label,
   Icon, 
   selected, 
   onClick 
}) => {
  return (
    <div
      // onClick={handleClick}
      className={`
        w-1/2
        flex 
        flex-col 
        items-center 
        justify-center 
        gap-2
        px-1
        py-3
        border-b-2
        hover:text-neutral-600
        hover:border-b-neutral-400
        mx-3
        transition
        cursor-pointer
        ${selected ? 'border-b-neutral-800' : 'border-transparent'}
        ${selected ? 'text-neutral-800' : 'text-neutral-500'}
      `}
      onClick={onClick}
      // Gọi onClick khi click vào component
    >
      {Icon}
      <div className="font-medium text-sm">
        {label}
      </div>
    </div>
  )
}