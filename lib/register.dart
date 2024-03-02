import 'package:demo/Constant.dart';
import 'package:demo/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 16.h,
                )),
            Text(
              "Create Account",
              style: GoogleFonts.montserrat(
                  fontSize: 16.sp, fontWeight: FontWeight.w700, color: blue),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0).h,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 6, spreadRadius: 6)
                ],
                borderRadius: BorderRadius.circular(10.h)),
            child: Padding(
              padding: const EdgeInsets.all(8.0).h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10).h,
                    child: Text(
                      "Please enter your credentials to proceed",
                      style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: blue),
                    ),
                  ),
                  const Divider(),
                  height(5.h),
                  Container(
                    height: 80.h,
                    width: 80.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                    child: Icon(
                      Icons.image_sharp,
                      size: 30.h,
                      color: blue,
                    ),
                  ),
                  height(10.h),
                  Text(
                    "Upload Profile Picture!",
                    style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500),
                  ),
                  height(5.h),
                  Padding(
                    padding: const EdgeInsets.only(
                            left: 5, top: 10, bottom: 5, right: 5)
                        .h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First name",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        height(5.h),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter first name",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h))),
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                            left: 5, top: 10, bottom: 5, right: 5)
                        .h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last name",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        height(5.h),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter Last name",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h))),
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                            left: 5, top: 10, bottom: 5, right: 5)
                        .h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        height(5.h),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter phone number",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h))),
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                            left: 5, top: 10, bottom: 5, right: 5)
                        .h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Address",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        height(5.h),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter email address",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h))),
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height(15.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5).h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        height(5.h),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
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
                                hintText: "Create password",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h))),
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        height(30.h),
                        Padding(
                          padding: const EdgeInsets.all(0).h,
                          child: SizedBox(
                            height: 40.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.h))),
                                    backgroundColor:
                                        MaterialStatePropertyAll(blue)),
                                onPressed: () {},
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                        height(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ));
                                },
                                child: Text(
                                  "Login!",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ))
                          ],
                        ),
                        height(10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
