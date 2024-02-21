const UserService = require('../services/user.services');

exports.register = async(req,res,next) => {
    try{
        const {email,password} = req.body;
        const successRes = await UserService.registerUser(email,password);
        res.json({status:true, success:"User registered successfully"});
    }catch(err) {
        throw err;
    }
}

exports.login = async(req,res,next) => {
    try{
        const {email,password} = req.body;
        const user = await UserService.checkUser(email);
        if(!user) {
            throw new Error(`User ${email} does not exist`);
        }
        const isMatch = await user.comparePassword(password);
        if(isMatch === false) {
            throw new Error(`Password InValid`);
        }
        
        let tokenData = {_id: user._id,email: user._email};

        const token = await UserService.generateToken(tokenData,"secretKey","1h");

        res.status(200).json({status:true,token:token})
        
    }catch(err) {
        throw err;
    }
}