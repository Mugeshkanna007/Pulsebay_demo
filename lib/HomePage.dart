import 'dart:convert';

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:demo/Constant.dart';
import 'package:demo/LoginScreen.dart';
import 'package:demo/ModelClass/IndustryModelClass.dart';
import 'package:demo/ModelClass/RegionsModelClass.dart';
import 'package:demo/ModelClass/TradieModelClass.dart';
import 'package:demo/RoutePage.dart';
import 'package:demo/TradieList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WorkList {
  final String title;
  final String img;

  WorkList({required this.title, required this.img});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Data> _countries = [];
  Data? _selectedCountry;

  List<Data1> _industries = [];
  Data1? _selectedIndustry;

  @override
  void initState() {
    super.initState();
    fetchCountries();
    fetchIntustry();
  }

  // Future<void> fetchTradieData() async {
  //   final String url = 'YOUR_API_ENDPOINT'; // Replace with your API endpoint
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final tradieModel = TradieModel.fromJson(json.decode(response.body));
  //     setState(() {
  //       _tradieData = tradieModel.data2;
  //     });
  //   } else {
  //     throw Exception('Failed to load tradie data');
  //   }
  // }

  Future<void> fetchCountries() async {
    final SharedPreferences keepLogin = await SharedPreferences.getInstance();
    var token = keepLogin.getString('token');
    // const String token = "375|CpSMi0aj6zOlpvvFqOANsZWDK0mOsU3xATDmMWXV";
    final response = await http.get(
      Uri.parse("$baseUrl/api/v1/regions"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      final regionsModel = RegionsModel.fromJson(json.decode(response.body));
      setState(() {
        _countries = regionsModel.data ?? [];
      });
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<void> logout() async {
    final SharedPreferences keepLogin = await SharedPreferences.getInstance();
    var token = keepLogin.getString('token');
    // const String token = "375|CpSMi0aj6zOlpvvFqOANsZWDK0mOsU3xATDmMWXV";
    final response = await http.get(
      Uri.parse("$baseUrl/api/v1/auth/logout"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<void> fetchIntustry() async {
    final SharedPreferences keepLogin = await SharedPreferences.getInstance();
    var token = keepLogin.getString('token');
    //const String token = "375|CpSMi0aj6zOlpvvFqOANsZWDK0mOsU3xATDmMWXV";
    final response = await http.get(
      Uri.parse("$baseUrl/api/v1/industries?offset=0&limit=5"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      final industryModel = IndustryModel.fromJson(json.decode(response.body));
      setState(() {
        _industries = industryModel.data1 ?? [];
      });
    } else {
      throw Exception('Failed to load countries');
    }
  }

  final List<WorkList> data = [
    WorkList(title: "PLUMBER", img: "assest/plumber.png"),
    WorkList(title: "ELECTRICIAN", img: "assest/electrician.png"),
    WorkList(title: "CLEANING", img: "assest/cleaning.png"),
    WorkList(title: "PAINTING", img: "assest/painting.png"),
    WorkList(title: "SALON", img: "assest/salon.png"),
    WorkList(title: "PEST CONTROL", img: "assest/pest.png"),
  ];

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [

//         Image.asset("assets/Ellipse.png")
//       ],
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the scaffold key
      backgroundColor: HexColor("F2F2F2"),
      drawer: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: 270.w,
        child: Padding(
          padding: const EdgeInsets.all(8.0).h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  height(50.h),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: 80.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.image_sharp,
                            size: 30.h,
                            color: Colors.black45,
                          ),
                        ),
                        height(10.h),
                        Text(
                          "Hi, Mugesh",
                          style: GoogleFonts.montserrat(
                              fontSize: 18.sp,
                              color: blue,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  height(15.h),
                  ListTile(
                    leading: Image.asset(
                      "assets/dashboard.png",
                      height: 20.h,
                    ),
                    title: drawerText("Dashboard"),
                  ),
                  const Divider(),
                  MyExpansionTile(
                    onExpansionChanged: (p0) {},
                    leading: Image.asset(
                      "assets/user.png",
                      height: 20.h,
                    ),
                    title: drawerText("My Account"),
                    children: [
                      ListTile(
                        leading: Image.asset(
                          "assets/dot.png",
                          height: 20.h,
                        ),
                        title: drawerText("Edit Account"),
                      ),
                      ListTile(
                        leading: Image.asset(
                          "assets/dot.png",
                          height: 20.h,
                        ),
                        title: drawerText("Change Password"),
                      ),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset(
                      "assets/messenger.png",
                      height: 20.h,
                    ),
                    title: drawerText("Chat"),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset(
                      "assets/suitcase.png",
                      height: 20.h,
                    ),
                    title: drawerText("My Jobs"),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset(
                      "assets/notification.png",
                      height: 20.h,
                    ),
                    title: drawerText("Notification"),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Image.asset(
                      "assets/phone-call.png",
                      height: 20.h,
                    ),
                    title: drawerText("Contact us"),
                  ),
                ],
              ),
              ListTile(
                onTap: () => logoutBtn(context),
                leading: Image.asset(
                  "assets/log-out.png",
                  height: 20.h,
                ),
                title: drawerText("Log out"),
              ),
            ],
          ),
        ),
      ),
      body: Stack(children: [
        Image.asset("assets/Ellipse.png"),
        SingleChildScrollView(
          child: Column(
            children: [
              height(45.h),
              Padding(
                padding: const EdgeInsets.all(8.0).h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10).h,
                      child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: BoxDecoration(
                              color: HexColor("#2A79C5"),
                              borderRadius: BorderRadius.circular(5.h),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                    color: Colors.black12)
                              ]),
                          child: Icon(
                            Icons.menu,
                            size: 18.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55).h,
                      child: Image.asset(
                        "assets/pulsebaylogo.png",
                        height: 50.h,
                      ),
                    ),
                  ],
                ),
              ),
              height(25.h),
              Text(
                "LOOKING FOR",
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              height(5.h),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10).h,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0).h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                            child: DropdownButtonFormField<Data1>(
                              value: _selectedIndustry,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedIndustry = newValue as Data1;
                                });
                              },
                              hint: Text(
                                "Select Industries",
                                style: GoogleFonts.montserrat(fontSize: 14.sp),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25.h,
                                  color: Colors.grey.shade400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                              ),
                              items: _industries.map((Data1 industry) {
                                return DropdownMenuItem<Data1>(
                                  value: industry,
                                  child: Text(
                                    industry.name ?? '',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                            child: DropdownButtonFormField(
                              value: _selectedCountry,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCountry = newValue;
                                });
                              },
                              hint: Text(
                                "Select Regions",
                                style: GoogleFonts.montserrat(fontSize: 14.sp),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 11.h, horizontal: 10.h),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25.h,
                                  color: Colors.grey.shade400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(7.h)),
                              ),
                              items: _countries
                                  .map<DropdownMenuItem<Data>>((Data country) {
                                return DropdownMenuItem<Data>(
                                  value: country,
                                  child: Text(
                                    country.name ?? '',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          height(20.h),
                          SizedBox(
                              height: 35.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.h))),
                                      backgroundColor:
                                          MaterialStatePropertyAll(blue)),
                                  onPressed: () {
                                    if (_selectedCountry == null ||
                                        _selectedIndustry == null) {
                                      final snackBar = SnackBar(
                                        content: Text(
                                          'Please selct Industries and Regions',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        action: SnackBarAction(
                                          backgroundColor: blue,
                                          label: 'Close',
                                          textColor: Colors.white,
                                          onPressed: () {},
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TradieList(
                                                region: _selectedCountry,
                                                industries: _selectedIndustry),
                                          ));
                                    }
                                  },
                                  child: Text(
                                    "Search",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              height(10.h),
              Padding(
                padding: const EdgeInsets.all(8.0).h,
                child: MyWorkGridView(
                  data: data,
                ),
              ),
              height(10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Most viewed Services",
                      style: GoogleFonts.montserrat(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  height(10.h),
                  MyRecentGridView(
                    data: data,
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  logoutBtn(BuildContext context) async {
    showCupertinoDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(
              "Are you sure",
              style: GoogleFonts.montserrat(),
            ),
            content: Text(
              "This action will clear only your app data! You can always access your profile by logging back in.",
              style: GoogleFonts.montserrat(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                // ignore: prefer_const_constructors
                child: Text(
                  "Cancel",
                  style: GoogleFonts.montserrat(color: Colors.blue),
                ),
              ),
              // #############
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  logout();
                  DeleteCache.deleteKey(
                      "cache",
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoutePage(),
                          )));
                  final SharedPreferences keepLogin =
                      await SharedPreferences.getInstance();
                  keepLogin.clear();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: blue),
                ),
              ),
            ],
          )),
    );
  }
}

class MyWorkGridView extends StatelessWidget {
  final List<dynamic> data;

  const MyWorkGridView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.h,
      spacing: 13.h,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/plumber.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("PLUMBER")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/electrician.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("ELECTRICIAN")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/cleaning.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("CLEANING")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/painting.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("PAINTING")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/salon.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("SALON")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/pest.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("PEST CONTROL")
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyRecentGridView extends StatelessWidget {
  final List<dynamic> data;

  const MyRecentGridView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.h,
      spacing: 13.h,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/plumber.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("PLUMBER")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/painting.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("PAINTING")
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 85.h,
            width: 85.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/salon.png",
                  height: 40.h,
                ),
                height(10.h),
                titleText("SALON")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
