import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:demo/Constant.dart';
import 'package:demo/ModelClass/IndustryModelClass.dart';
import 'package:demo/ModelClass/RegionsModelClass.dart';
import 'package:demo/ModelClass/TradieModelClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TradieList extends StatefulWidget {
  final Data? region;
  final Data1? industries;

  const TradieList({
    super.key,
    this.region,
    this.industries,
  });

  @override
  State<TradieList> createState() => _TradieListState();
}

class _TradieListState extends State<TradieList> {
  List<Data2>? _tradieData = [];
  @override
  void initState() {
    super.initState();
    fetchTradieData();
  }

  Future<void> fetchTradieData() async {
    final SharedPreferences keepLogin = await SharedPreferences.getInstance();
    var token = keepLogin.getString('token');
    final String region = widget.region!.name ?? "";
    print(region);
    //  const String token = "375|CpSMi0aj6zOlpvvFqOANsZWDK0mOsU3xATDmMWXV";
    final response = await http.get(
      Uri.parse("$baseUrl/api/v1/search?industries=5,6&region=$region"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    //  print(response.body);
    if (response.statusCode == 200) {
      final tradieModel = TradieModel.fromJson(json.decode(response.body));
      setState(() {
        _tradieData = tradieModel.data2 ?? [];
        print(_tradieData);
      });
    } else {
      throw Exception('Failed to load tradie data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgWhite,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 300.w,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5).h,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 18.h,
                  ),
                ),
                Text(
                  widget.industries!.name ?? "",
                  style: GoogleFonts.montserrat(
                      fontSize: 18.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        body: _tradieData == null
            ? const Center(child: CircularProgressIndicator())
            : _tradieData!.isEmpty
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12).h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/no-location.png",
                          height: 40.h,
                        ),
                        Text(
                          "No workers here now. Try again later",
                          style: GoogleFonts.montserrat(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ))
                : Padding(
                    padding: const EdgeInsets.all(10).h,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5)
                              .h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40.h,
                                width: 260.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.h),
                                    border: Border.all(color: Colors.black38)),
                                child: Center(
                                    child: Text(
                                  "Advanced Search",
                                  style: GoogleFonts.montserrat(
                                      color: HexColor("#022A4A"),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.h),
                                    border: Border.all(color: Colors.black38)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0).h,
                                  child: Image.asset(
                                    "assets/net.png",
                                    height: 5.h,
                                    color: HexColor("#022A4A"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        height(10.h),
                        Expanded(
                            child: ListView.builder(
                          itemCount: _tradieData!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            int rating = _tradieData![index].id ?? 0;
                            return Container(
                              margin: const EdgeInsets.only(
                                      bottom: 5, left: 5, right: 5, top: 5)
                                  .h,
                              // height: 80.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 6,
                                        spreadRadius: 3,
                                        color: Colors.black12)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0).h,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.h),
                                      child: SizedBox(
                                        height: 70.h,
                                        width: 70.h,
                                        child: Image.asset(
                                          "assets/industry.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    width(10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5).h,
                                          child: Text(
                                            _tradieData![index].firstName ?? "",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        height(2.h),
                                        RatingBar.builder(
                                          initialRating: rating.toDouble(),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20.h,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 3.0.w),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        height(2.h),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 20.h,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              _tradieData![index].city ?? "",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  ));
  }
}
