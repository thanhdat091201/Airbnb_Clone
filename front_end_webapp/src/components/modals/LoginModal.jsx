import { FcGoogle } from "react-icons/fc";
import { AiFillGithub } from "react-icons/ai";
import { useState, useCallback, useContext } from "react";
import { useForm } from "react-hook-form";
import useLoginModal from "../../hooks/useLoginModal";
import useRegisterModal from "../../hooks/useRegisterModal";
import Modal from "./Modal";
import Heading from "../common/Heading";
import Input from "../common/Input/Input";
import Button from "../common/Button/Button"
import axios from "axios";
import { UserContext } from "../../contexts/UserContext";

const LoginModal = () => {
  const loginModal = useLoginModal();
  const registerModal = useRegisterModal();
  const { setUser } = useContext(UserContext);
  const [isLoading, setIsLoading] = useState(false);
  const { 
    register, 
    handleSubmit,
    formState: {
      errors
    },
  } = useForm({
    defaultValues: {
      email: '',
      password: ''
    }
  });

  // const onSubmit = (data) => console.log(data)
  const onSubmit = async ({ email, password }) => {
    setIsLoading(true);
    const {data} = await axios.post('/login', {email, password})
    .then((response) => {
      loginModal.toggle();
      return response;
    })
    .catch((err) => {
      console.log(err);
    })
    .finally(() => {
      setIsLoading(false);
    })
    setUser(data)
  }

  const onToggle = useCallback(() => {
    loginModal.toggle();
    registerModal.toggle();
  }, [loginModal, registerModal])

  const bodyContent = (
    <div className="flex flex-col gap-4">
      <Heading
        title="Welcome back"
        subtitle="Login to your account!"
      />
      <Input
        id="email"
        label="Email"
        disabled={isLoading}
        register={register}  
        errors={errors}
        minLength={4}
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
        onClick={() => {}}
      />
      <Button 
        outline 
        label="Continue with Github"
        Icon={<AiFillGithub />}
        onClick={() => {}}
      />
      <div className="
      text-neutral-500 text-center mt-4 font-light">
        <p>First time using Airbnb?
          <button 
            onClick={onToggle} 
            className="
              ml-1
              text-neutral-800
              cursor-pointer 
              hover:underline
              mb-4
            "
            > Create an account</button>
        </p>
      </div>
    </div>
  )
  return (
    <Modal
      disabled={isLoading}
      isOpen={loginModal.isOpen}
      title="Login"
      actionLabel="Continue"
      onClose={loginModal.toggle}
      onSubmit={handleSubmit(onSubmit)}
      body={bodyContent}
      footer={footerContent}
    />
  )
}

export default LoginModal