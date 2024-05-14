import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Screens/Views/order_tab1.dart'; // Import OrderTab1 widget
import 'package:final_project/Screens/Views/order_tab2.dart'; // Import OrderTab2 widget

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Orders",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.3),
                Colors.white.withOpacity(0.3),
                Colors.indigo.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 00),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 235, 235, 235)),
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  color: Color.fromARGB(255, 5, 185, 155),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                indicatorColor: const Color.fromARGB(255, 241, 241, 241),
                                unselectedLabelColor: const Color.fromARGB(255, 32, 32, 32),
                                labelColor: Color.fromARGB(255, 255, 255, 255),
                                controller: _tabController,
                                tabs: const [
                                  Tab(text: "Upcoming"),
                                  Tab(text: "Completed"),
                                  Tab(text: "Cancel"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        // OrderTab1(), // Uncomment this line if OrderTab1 is defined here
                        OrderTab1(), // Or use the imported widget
                        OrderTab2(),
                        OrderTab2(),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
