import { AiFillGithub } from "react-icons/ai";
import { FcGoogle } from "react-icons/fc";
import { useState, useCallback } from "react";
import { useForm } from "react-hook-form";
import axios from "axios";
import useLoginModal from "../../hooks/useLoginModal";
import useRegisterModal from "../../hooks/useRegisterModal";
import Modal from "./Modal";
import Heading from "../common/Heading";
import Input from "../common/Input/Input";
import Button from "../common/Button/Button";

const RegisterModal = () => {
  const registerModal = useRegisterModal();
  const loginModal = useLoginModal();
  const [isLoading, setIsLoading] = useState(false);

  const { 
    register, 
    handleSubmit,
    formState: {
      errors
    },
  } = useForm({
    defaultValues: {
      name: '',
      email: '',
      password: ''
    }
  });

  const onSubmit = ({ name, email, password }) => {
    setIsLoading(true)
    axios.post('/register', {
      name,
      email,
      password
    })
    .then(() => {
      // toast.success('Registered!');
      registerModal.toggle();
      loginModal.toggle();
    })
    .catch((error) => {
      // toast.error(error);
      console.log(error);
    })
    .finally(() => {
      setIsLoading(false);
    })
  }

  const onToggle = useCallback(() => {
    registerModal.toggle();
    loginModal.toggle();
  }, [registerModal, loginModal])

  const bodyContent = (
    <div className="flex flex-col gap-4">
      <Heading
        title="Welcome to Airbnb"
        subtitle="Create an account!"
      />
      <Input
        id="email"
        label="Email"
        type="email"
        disabled={isLoading}
        register={register}
        errors={errors}
        required
      />
      <Input
        id="name"
        label="Name"
        disabled={isLoading}
        register={register}
        errors={errors}
        required
      />
      <Input
        id="password"
        label="Password"
        type="password"
        disabled={isLoading}
        register={register}
        errors={errors}
        required
      />
    </div>
  )

  const footerContent = (
    <div className="flex flex-col gap-4 mt-3">
      <hr />
      <Button 
        outline 
        label="Continue with Google"
        Icon={<FcGoogle />}
        onClick={onToggle}
      />
      <Button 
        outline 
        label="Continue with Github"
        Icon={<AiFillGithub />}
        onClick={() => console.log('click')}
      />
      <div 
        className="
          text-neutral-500 
          text-center 
          mb-4
          mt-2 
          font-light
        "
      >
        <p>Already have an account?
          <span 
            onClick={onToggle} 
            className="
              ml-1
              text-neutral-800
              cursor-pointer 
              hover:underline
            "
            >Log in</span>
        </p>
      </div>
    </div>
  )

  return (
    <Modal
      disabled={isLoading}
      isOpen={registerModal.isOpen}
      title="Register"
      actionLabel="Continue"
      onClose={registerModal.toggle}
      onSubmit={handleSubmit(onSubmit)}
      body={bodyContent}
      footer={footerContent}
    />
  )
}

export default RegisterModal