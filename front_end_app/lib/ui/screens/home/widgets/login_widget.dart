// import 'package:front_end/infrastructure/providers/auth_provider/auth_provider.dart';
import 'dart:convert';
import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/config/config.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/ui/screens/home/screens/widgets/login_options_tile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class LoginWidget extends ConsumerStatefulWidget {
  final double? width;
  const LoginWidget({Key? key, this.width}) : super(key: key);

  @override
  ConsumerState<LoginWidget> createState() => _LoginWidgetState(); 
}

class _LoginWidgetState extends ConsumerState<LoginWidget> {
  bool isSignInSelected = true;
  double _slideValue = 0.0;

  final email = TextEditingController();
  final password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void funcLogin() async {
    final strEmail = email.text;
    final strPassword = password.text;
    if((email.text.isNotEmpty && password.text.isNotEmpty) || (strEmail == "admin") && (strPassword == "123")) {
      var regBody = {
        "email" : strEmail,
        "password" : strPassword
      };

      var response = await http.post(Uri.parse(login),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody)
      );

      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        // authProviderRead.changeLoggedIn(true);
        // // ignore: use_build_context_synchronously
        // Navigator.pop(context);
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: const Text('Warning'),
              content: const Text('Username or password is not correct'),
              actions: [
                GestureDetector(
                  onTap: () {
                    return Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                    child: const Center(
                      child: AppText(
                        title: "OK",
                        fontSize: 16,
                        lineHeight: 1,
                        titleColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  )
                )
              ],
            );
          }
        ); 
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProviderRead = ref.read(authProvider);
    final bool hasTopNotch = MediaQuery.of(context).padding.top > 24.0;
    final maxHeight = MediaQuery.of(context).size.height * (0.85);

    final regEmail = TextEditingController();
    final regPassword = TextEditingController();
    final regConfirmPassword = TextEditingController();

    

  void signUpButtonPressed() async {
    String email = regEmail.text;
    String password = regPassword.text;
    String confirmPassword = regConfirmPassword.text;

    if(regEmail.text.isNotEmpty && regPassword.text.isNotEmpty && regEmail.text.isNotEmpty) {
      if (password == confirmPassword) {
      var regBody = {
        "email" : email,
        "password" : password
      };

      var response = await http.post(Uri.parse(registration),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody)
      );

      // ignore: avoid_print
      print(response);
      authProviderRead.changeLoggedIn(true);                                          
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: const Text('Error'),
              content: const Text('Password and confirm password do not match, Please re-enter'),
              actions: [
                GestureDetector(
                  onTap: () {
                    return Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                    child: const Center(
                      child: AppText(
                        title: "OK",
                        fontSize: 16,
                        lineHeight: 1,
                        titleColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  )
                )
              ],
            );
          }
        ); 
      }  
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: const Text('Warning'),
            content: const Text('Email and password can\'t be empty'),
            actions: [
              GestureDetector(
                onTap: () {
                  return Navigator.of(context).pop();
                },
                child: Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: const Center(
                    child: AppText(
                      title: "OK",
                      fontSize: 16,
                      lineHeight: 1,
                      titleColor: Color(0xFFFFFFFF),
                    ),
                  ),
                )
              )
            ],
          );
        }
      );
    }
  }

    return Container(
      width: widget.width,
      child: Column(
        children: [
          Container(
            width: widget.width,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFBE1A1F)),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    )),
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: hasTopNotch ? 20 : 8),
                      height:maxHeight,
                      child: Column(
                        children: [ 
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSignInSelected = true;
                                      _slideValue = 0.0;
                                    });
                                  },
                                  child: AnimatedContainer(
                                      curve: Curves.linear,
                                      duration: const Duration(seconds: 1),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 2.0, color: isSignInSelected ? Colors.black : Colors.transparent),
                                        ),
                                      ),
                                      child: AppText(
                                          title: "Sign In",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          titleColor: !isSignInSelected ? const Color(0xFF717171) : Colors.black)),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSignInSelected = false;
                                      _slideValue = -1.0;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 2.0, color: !isSignInSelected ? Colors.black : Colors.transparent),
                                      ),
                                    ),
                                    child: AppText(
                                        title: "Sign Up",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        titleColor: isSignInSelected ? const Color(0xFF717171) : Colors.black),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                transform: Matrix4.translationValues(
                                  MediaQuery.of(context).size.width * _slideValue,
                                  0,
                                  0,
                                ),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: email,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ), labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: password,
                                      obscureText: true,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                        ), labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const AppText(
                                      title: 'We will check your account and verify your email to confirm the account.',
                                      fontSize: 16,
                                      overflow: TextOverflow.visible,
                                    ),
                                    TextButton(onPressed: () {}, child: const Text('Forgot Password?', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),)),
                                    SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          funcLogin();
                                          authProviderRead.changeLoggedIn(true);
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: const Color(0xFFBE1A1F),
                                          ),
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: AppText(
                                              title: "Sign In",
                                              fontSize: 16,
                                              lineHeight: 1,
                                              titleColor: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          child: AppText(
                                            title: 'or',
                                            fontSize: 16,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.gmailIcon, title: 'Continue with Email'),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.appleIcon, title: 'Continue with Apple'),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.googleIcon, title: 'Continue with Google'),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.facebookIcon, title: 'Continue with Facebook'),
                                  ]
                                )
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                transform: Matrix4.translationValues(
                                  MediaQuery.of(context).size.width * (_slideValue + 1),
                                  0,
                                  0,
                                ),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: regEmail,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ), labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: regPassword,
                                      obscureText: true,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                        ), labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: regConfirmPassword,
                                      obscureText: true,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          // errorText: _isNotValidate ? "Enter Proper Info" : null,
                                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                        ), labelText: 'Confirm Password',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          signUpButtonPressed();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:  const Color(0xFFBE1A1F),
                                          ),
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: AppText(
                                              title: "Sign Up",
                                              fontSize: 16,
                                              lineHeight: 1,
                                              titleColor: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          child: AppText(
                                            title: 'or',
                                            fontSize: 16,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.gmailIcon, title: 'Continue with Email'),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.appleIcon, title: 'Continue with Apple'),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.googleIcon, title: 'Continue with Google'),
                                    const SizedBox(height: 10),
                                    const LoginOptionTile(icon: ImageConstants.facebookIcon, title: 'Continue with Facebook'),
                                  ]
                                )
                              )
                            ]
                          )
                        ]
                      )
                    );
                  }
                );
              },
              child: const Align(
                alignment: Alignment.center,
                child: AppText(
                  title: "Start Login",
                  fontSize: 16,
                  lineHeight: 1,
                  titleColor: Color(0xFFFFFFFF),
                ),
              ),
            )
          )
        ]
      )
    );
  }
  
}
