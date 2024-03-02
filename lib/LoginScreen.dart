// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:demo/Constant.dart';
import 'package:demo/HomePage.dart';
import 'package:demo/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = "";
  bool _isLoading = false;
  bool _obscureText = true;
//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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
//  "email":"visnu.unsiv@gmail.com",
//     "password":"Vishnu@2023",
//     "firebase_token":"sdsdasdfsdgsfvgedsrg3"

  void login() async {
    String email = _email.text;
    String password = _password.text;
    print(email);
    print(password);
    Response response = await post(
      Uri.parse('$baseUrl/api/v1/customers/login'),
      body: {
        "email": email,
        "password": password,
        "firebase_token": "sdsdasdfsdgsfvgedsrg3"
      },
    );

    var token = jsonDecode(response.body);
    print(token);
    if (response.statusCode == 200) {
      final SharedPreferences keepLoginU =
          await SharedPreferences.getInstance();
      keepLoginU.setString('token', token['accessToken']);
      Future.delayed(const Duration(seconds: 2), () async {
        setState(() {
          _isLoading = false;
        });
        errorMessage = "";
        pushBottomMenu();
        print("Login successful!");
      });
    } else if (response.statusCode == 401 &&
        token["message"] == "Please enter valid email and password") {
      Future.delayed(const Duration(seconds: 2), () async {
        setState(() {
          _isLoading = false;
        });
        setState(() {
          var error = jsonDecode(response.body);
          errorMessage = error["message"];
        });
        // errorMessage = "Invalid Email/PhoneNo. or Password.";
      });
    }
    //} catch (e) {
    //print(e);
    //}
  }

  pushBottomMenu() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Add this line
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_new,
//               size: 16.h,
//             )),
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: 70.h),
//               child: Image.asset(
//                 "assets/pulsebaylogo.png",
//                 height: 80.h,
//               ),
//             ),
//             Expanded(
//               flex: 0,
//               child: Container(
//                 height: 420.h,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: const [
//                       BoxShadow(
//                           spreadRadius: 6, blurRadius: 6, color: Colors.black12)
//                     ],
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15.h),
//                         topRight: Radius.circular(15.h))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0).h,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 10, top: 10, bottom: 10)
//                                 .h,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Welcome",
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 24.sp,
//                                   fontWeight: FontWeight.w700,
//                                   color: blue),
//                             ),
//                             height(3.h),
//                             Text(
//                               "Hello there, Sign in to continue!",
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 15.sp,
//                                   fontWeight: FontWeight.w300,
//                                   color: Colors.black87),
//                             )
//                           ],
//                         ),
//                       ),
//                       const Divider(),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                                 left: 10, top: 10, bottom: 5, right: 10)
//                             .h,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Email Address",
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 15.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black87),
//                             ),
//                             height(5.h),
//                             SizedBox(
//                               height: 40.h,
//                               child: TextFormField(
//                                 controller: _email,
//                                 decoration: InputDecoration(
//                                     hintText: "Enter Email Address...",
//                                     hintStyle: GoogleFonts.montserrat(
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black26),
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 11.h, horizontal: 10.h),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey.shade300,
//                                           width: 1.5,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(7.h)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey.shade300,
//                                           width: 1.5,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(7.h)),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey.shade300,
//                                           width: 1.5,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(7.h))),
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black87),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       height(5.h),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 10, top: 10, right: 10)
//                                 .h,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Password",
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 15.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black87),
//                             ),
//                             height(5.h),
//                             SizedBox(
//                               height: 40.h,
//                               child: TextFormField(
//                                 controller: _password,
//                                 decoration: InputDecoration(
//                                     hintText: "Enter Password...",
//                                     hintStyle: GoogleFonts.montserrat(
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black26),
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 11.h, horizontal: 10.h),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey.shade300,
//                                           width: 1.5,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(7.h)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey.shade300,
//                                           width: 1.5,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(7.h)),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey.shade300,
//                                           width: 1.5,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(7.h))),
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black87),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               "Forgot Password?",
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black87),
//                             )),
//                       ),
//                       Center(
//                           child: Text(
//                         errorMessage!,
//                         style: GoogleFonts.montserrat(
//                             fontSize: 14.sp, color: Colors.red),
//                       )),
//                       Padding(
//                         padding: const EdgeInsets.all(9.0).h,
//                         child: SizedBox(
//                           height: 40.h,
//                           width: double.infinity,
//                           child: _isLoading
//                               ? const Center(
//                                   child:
//                                       CircularProgressIndicator()) // Display a loading indicator while logging in
//                               : ElevatedButton(
//                                   style: ButtonStyle(
//                                       shape: MaterialStatePropertyAll(
//                                           ContinuousRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10.h))),
//                                       backgroundColor:
//                                           MaterialStatePropertyAll(blue)),
//                                   onPressed: () {
//                                     if (_email.text.isEmpty ||
//                                         _password.text.isEmpty) {
//                                       if (_email.text.isEmpty) {
//                                         setState(() {
//                                           errorMessage = "Please enter email";
//                                         });
//                                       } else {
//                                         setState(() {
//                                           errorMessage =
//                                               "Please enter password";
//                                         });
//                                       }
//                                     } else {
//                                       setState(() {
//                                         _isLoading = true;
//                                       });
//                                       login();
//                                     }
//                                   },
//                                   child: Text(
//                                     "Login",
//                                     style: GoogleFonts.montserrat(
//                                         fontSize: 15.sp,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white),
//                                   )),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don’t have an account?",
//                             style: GoogleFonts.montserrat(
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.black87),
//                           ),
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           const RegisterPage(),
//                                     ));
//                               },
//                               child: Text(
//                                 "Register!",
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 15.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87),
//                               ))
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Change to true
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16.h,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 70.h),
              child: Image.asset(
                "assets/pulsebaylogo.png",
                height: 80.h,
              ),
            ),
            Container(
              height: 470.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 6,
                    blurRadius: 6,
                    color: Colors.black12,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.h),
                  topRight: Radius.circular(15.h),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0).h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10)
                              .h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: GoogleFonts.montserrat(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: blue,
                            ),
                          ),
                          height(3.h),
                          Text(
                            "Hello there, Sign in to continue!",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 5, right: 10)
                          .h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email Address",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          height(5.h),
                          SizedBox(
                            height: 40.h,
                            child: TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                hintText: "Enter Email Address...",
                                hintStyle: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black26,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(7.h),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(7.h),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(7.h),
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height(5.h),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 10).h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          height(5.h),
                          SizedBox(
                            height: 40.h,
                            child: TextFormField(
                              obscureText: _obscureText,
                              controller: _password,
                              decoration: InputDecoration(
                                hintText: "Enter Password...",
                                hintStyle: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black26,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(7.h),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(7.h),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(7.h),
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        errorMessage!,
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0).h,
                      child: SizedBox(
                        height: 40.h,
                        width: double.infinity,
                        child: _isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.h),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(blue),
                                ),
                                onPressed: () {
                                  if (_email.text.isEmpty ||
                                      _password.text.isEmpty) {
                                    if (_email.text.isEmpty) {
                                      setState(() {
                                        errorMessage = "Please enter email";
                                      });
                                    } else {
                                      setState(() {
                                        errorMessage = "Please enter password";
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    login();
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Register!",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
