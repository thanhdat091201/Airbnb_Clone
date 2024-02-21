const InteractiveText = ({
  label,
  IconFront,
  IconBack,
  onClick,
  bold
}) => {
  return (
    <button
     className={`
      p-0.5
      flex
      flex-row 
      items-center
      text-sm
      gap-0.5
      cursor-pointer
      ${bold ? 'font-semibold whitespace-nowrap' : ''}
    `}
     onClick={onClick}
    >
      {IconFront}
      <div className={`
        hover:underline decoration-1 text-neutral-800
        ${bold ? 'pb-0.5' : ''}
      `}>
        {label}
      </div>
      {IconBack}
    </button>
  )
}

export default InteractiveText;