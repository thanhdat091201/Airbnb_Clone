export function Container({ children, size }) {

  const marginX =
    size === 'small'
      ? 'xl:px-20 md:px-10 sm:px-2 px-4'
      : size === 'medium'
      ? '2xl:px-80 md:px-28 sm:px-5 px-5'
      : size === 'large'
      ? 'xl:px-96 md:px-28 sm:px-10 px-12'
      : 'xl:px-5 px-4';

  return (
    <div className={`max-w-[2520px] mx-auto ${marginX}'`}>
      {children}
    </div>
  )
}

