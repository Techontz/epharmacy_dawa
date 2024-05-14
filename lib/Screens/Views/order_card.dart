import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderCard extends StatefulWidget {
  final String mainText;
  final String orderNo;
  final String image;
  final String date;
  final String time;
  final String confirmation;

  OrderCard({
    required this.mainText,
    required this.orderNo,
    required this.date,
    required this.confirmation,
    required this.time,
    required this.image,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isVisible = false;
            });
          },
          child: Container(
            height: 24.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 7.h,
                      width: 60.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.mainText,
                              style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.orderNo,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 99, 99, 99),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 10.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8), // Square shape
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 3.h,
                  width: 85.w,
                  child: Row(
                    children: [
                      Container(
                        height: 3.h,
                        width: 7.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("lib/icons/callender2.png"),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Text(
                        widget.date,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                      Container(
                        height: 3.h,
                        width: 7.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("lib/icons/watch.png"),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Text(
                        widget.time,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                      Container(
                        height: 3.h,
                        width: 7.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("lib/icons/elips.png"),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Text(
                        widget.confirmation,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 4.5.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 232, 233, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 61, 61, 61),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 4.5.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 190, 144),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Via Whatsapp",
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 252, 252, 252),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
