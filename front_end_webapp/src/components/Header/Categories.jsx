import { HiChevronLeft, HiChevronRight } from 'react-icons/hi';
import { LuSettings2 } from 'react-icons/lu';
import { Container } from '../common/Container';
import { CategoryBox } from './CategoryBox';
import { useState, useRef } from 'react';
import { categories } from './../../constants/Categories'


export const Categories = () => {
  const [selectedCategory, setSelectedCategory] = useState(categories[0]?.label || null);
  const containerRef = useRef(null);

  const handleItemClick = (clickedLabel) => {
    setSelectedCategory(clickedLabel);
  };

  const handleScrollLeft = () => {
    containerRef.current.scrollLeft -= 350;
  };

  const handleScrollRight = () => {
    containerRef.current.scrollLeft += 350;
  };

  return (
    <Container size={'small'}>
      <div className="
          flex
          flex-row
          justify-center
          items-center 
          justify-between
          gap-3
        "
      >
        <div 
          onClick={handleScrollLeft}
          className="
            p-1
            border-[1px] 
            border-neutral-200  
            rounded-full
            cursor-pointer 
            hover:shadow-md 
            transition
            ease-in-out
            hover:scale-105
            duration-200
          "
        >
          <HiChevronLeft size={20} />
        </div>
        <div
          ref={containerRef}
          className="
            w-[95%]
            pt-4
            flex 
            flex-row 
            items-center 
            justify-between
            overflow-hidden
            scroll-smooth
          "
        >
          {categories.map((item) => {
            const {label, Icon} = item
            const isSelected = selectedCategory === label;
            return (
              <CategoryBox
                key={label}
                label={label}
                Icon={<Icon size={23} />}
                selected={isSelected}
                onClick={() => handleItemClick(label)}
              />
            )
          })}
        </div>
        <div 
          onClick={handleScrollRight}
          className="
            p-1
            border-[1px] 
            border-neutral-200  
            rounded-full
            cursor-pointer 
            hover:shadow-md 
            transition
            ease-in-out
            hover:scale-105
            duration-200
          "
        >
          <HiChevronRight size={20} />
        </div>
        <button 
          onClick={() => {}}
          className="
            my-5
            p-4
            md:py-3
            md:px-3
            border-[1px] 
            border-neutral-200 
            font-semibold 
            text-sm
            flex 
            flex-row 
            items-center 
            gap-2 
            rounded-lg
            cursor-pointer 
            hover:shadow-md 
            transition
          "
        >
          <LuSettings2 size={15}/>   
          Filters
        </button>
      </div>
    </Container>
  )
}