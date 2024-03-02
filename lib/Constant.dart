// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Color blue = HexColor("#2A79C5");
Color bgWhite = HexColor("F2F2F2");
const baseUrl = "http://54.153.163.153";

Widget height(double x) => SizedBox(
      height: x,
    );
Widget width(double x) => SizedBox(
      width: x,
    );

Widget titleText(String val) {
  return Text(
    val,
    style: GoogleFonts.montserrat(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget drawerText(String val) {
  return Text(
    val,
    style: GoogleFonts.montserrat(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}

class MyExpansionTile extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final Function(bool) onExpansionChanged;

  MyExpansionTile({
    Key? key,
    required this.leading,
    required this.title,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
    required this.onExpansionChanged,
  }) : super(key: key);

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool? _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.initiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: widget.leading,
          title: widget.title,
          trailing: _isExpanded!
              ? const Icon(Icons.keyboard_arrow_up)
              : const Icon(Icons.keyboard_arrow_down),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded!;
            });
            widget.onExpansionChanged(_isExpanded!);
          },
        ),
        if (_isExpanded!)
          Column(
            children: widget.children,
          ),
      ],
    );
  }
}
