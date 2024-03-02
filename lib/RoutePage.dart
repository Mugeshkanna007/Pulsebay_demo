import 'package:demo/Constant.dart';
import 'package:demo/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 130.h),
            child: Image.asset(
              "assets/pulsebaylogo.png",
              height: 80.h,
            ),
          ),
          SizedBox(
            height: 250.h,
            child: Stack(
              children: [
                // Large container at the bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 6,
                          blurRadius: 6,
                          color: Colors.black12,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.h),
                        topRight: Radius.circular(15.h),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                endIndent: 20,
                                indent: 10,
                              ),
                            ),
                            Text(
                              "Login as a",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                            const Expanded(
                              child: Divider(
                                endIndent: 20,
                                indent: 10,
                              ),
                            ),
                          ],
                        ),
                        height(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 150.w,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.h))),
                                      backgroundColor:
                                          MaterialStatePropertyAll(blue)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ));
                                  },
                                  child: Text(
                                    "Customer",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              height: 35.h,
                              width: 150.w,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.h))),
                                      backgroundColor:
                                          MaterialStatePropertyAll(blue)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ));
                                  },
                                  child: Text(
                                    "Tradie",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 3,
                            color: Colors.black12,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                      ),
                      child: Center(
                        child: Text(
                          "Welcome",
                          style: GoogleFonts.montserrat(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: blue),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
