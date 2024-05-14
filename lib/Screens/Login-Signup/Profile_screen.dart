import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Screens/Widgets/profile_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.indigo.withOpacity(0.6),
            // Colors.indigo.withOpacity(1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.4],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage("lib/icons/piccc.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("lib/icons/camra.png"))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Conrad Bubex",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.0900,
                      width: MediaQuery.of(context).size.width * 0.2500,
                      child: Column(children: [
                        Container(
                          height:
                          MediaQuery.of(context).size.height * 0.0400,
                          width: MediaQuery.of(context).size.width * 0.1500,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/icons/gender.png"),
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                        Text(
                          "Gender",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 245, 243, 243)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Male",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.white,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.0900,
                      width: MediaQuery.of(context).size.width * 0.2500,
                      child: Column(children: [
                        Container(
                          height:
                          MediaQuery.of(context).size.height * 0.0400,
                          width: MediaQuery.of(context).size.width * 0.1500,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/icons/calender1.png"),
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                        Text(
                          "Date of Birth",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 245, 243, 243)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "12/Feb",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.white,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.0900,
                      width: MediaQuery.of(context).size.width * 0.2500,
                      child: Column(children: [
                        Container(
                          height:
                          MediaQuery.of(context).size.height * 0.0400,
                          width: MediaQuery.of(context).size.width * 0.1500,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/icons/blood.png"),
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                        Text(
                          "Blood Group",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 245, 243, 243)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "AB",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 550,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  profile_list(
                    image: "lib/icons/profile1.png",
                    title: "Profile Details",
                    color: Colors.black87,
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Divider(),
                  ),
                  profile_list(
                    image: "lib/icons/orders.png",
                    title: "Order History",
                    color: Colors.black87,
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Divider(),
                  ),
                  profile_list(
                    image: "lib/icons/pay1.png",
                    title: "Payment Method",
                    color: Colors.black87,
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Divider(),
                  ),
                  profile_list(
                    image: "lib/icons/setting.png",
                    title: "Settings",
                    color: Colors.black87,
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Divider(),
                  ),profile_list(
                    image: "lib/icons/FAQs.png",
                    title: "FAQs",
                    color: Colors.black87,
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Divider(),
                  ),
                  profile_list(
                    image: "lib/icons/logout.png",
                    title: "Log out",
                    color: Colors.red,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
