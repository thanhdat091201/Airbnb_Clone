import { BiDollar } from "react-icons/bi";
import { FcHighPriority } from "react-icons/fc";

const Input = ({
  id,
  label,
  type = "text", 
  disabled, 
  formatPrice,
  register,
  required,
  errors,
  minLength = 3
}) => {
  return (
    <>
      <div className="w-full relative">
        {formatPrice && (
          <BiDollar
            size={24}  
            className="
              text-neutral-700
              absolute
              top-5
              left-2
            "
          />
        )}
        <input
          id={id}
          disabled={disabled}
          {...register(id, { required, minLength: minLength })}
          placeholder=" "
          type={type}
          className={`
            peer
            w-full
            p-4
            pt-6 
            font-light 
            bg-white 
            border-2
            rounded-md
            outline-none
            transition
            disabled:opacity-70
            disabled:cursor-not-allowed
            ${formatPrice ? 'pl-9' : 'pl-4'}
            ${errors[id] ? 'border-rose-500' : 'border-neutral-300'}
            ${errors[id] ? 'focus:border-rose-500' : 'focus:border-black'}
          `}
        />
        <label 
          className={`
            absolute 
            text-md
            duration-150 
            transform 
            -translate-y-3 
            top-5 
            z-10 
            origin-[0] 
            ${formatPrice ? 'left-9' : 'left-4'}
            peer-placeholder-shown:scale-100 
            peer-placeholder-shown:translate-y-0 
            peer-focus:scale-75
            peer-focus:-translate-y-4
            ${errors[id] ? 'text-rose-500' : 'text-zinc-400'}
          `}
        >
          {label}
        </label>
      </div>
      {errors?.[id]?.type === "required" && (
        <div className="flex flex-row items-center gap-2">
          <FcHighPriority />
          <span className="text-rose-500">This field is required</span>
        </div>
      )}
      {errors?.[id]?.type === "minLength" && (
        <div className="flex flex-row items-center gap-2">
          <FcHighPriority />
          <span className="text-rose-500">Minimum {minLength} characters required</span>
        </div>
      )}
    </>
  )
}

export default Input;