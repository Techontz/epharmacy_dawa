import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: OrderProcessingScreen(),
  ));
}

class OrderProcessingScreen extends StatefulWidget {
  @override
  _OrderProcessingScreenState createState() => _OrderProcessingScreenState();
}

class _OrderProcessingScreenState extends State<OrderProcessingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Order> pendingPrescriptionOrders = [
    Order(orderNumber: '1', medicineName: 'Medicine A', image: 'assets/images/motrin1.png', user: User(name: 'John Doe', phoneNumber: '123-456-7890', address: '123 Main St'), status: OrderStatus.pending),
    Order(orderNumber: '2', medicineName: 'Medicine B', image: 'assets/images/anti2.png', user: User(name: 'Jane Smith', phoneNumber: '987-654-3210', address: '456 Elm St'), status: OrderStatus.pending),
  ];
  List<Order> confirmedPrescriptionOrders = [];
  List<int> expandedOrders = []; // Track expanded orders
  Order? selectedOrder; // Track the selected order

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void confirmPendingOrder(Order order) {
    setState(() {
      pendingPrescriptionOrders.remove(order);
      order.status = OrderStatus.confirmed; // Change the status to Confirmed
      confirmedPrescriptionOrders.add(order);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.medicineName} confirmed.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void unconfirmConfirmedOrder(Order order) {
    setState(() {
      confirmedPrescriptionOrders.remove(order);
      order.status = OrderStatus.pending; // Change the status to Pending
      pendingPrescriptionOrders.add(order);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.medicineName} unconfirmed.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void cancelPendingOrder(Order order) {
    setState(() {
      pendingPrescriptionOrders.remove(order);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${order.medicineName} canceled.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget buildOrderCard(Order order, bool isConfirmed) {
    bool isExpanded = expandedOrders.contains(order.hashCode);
    bool isSelected = selectedOrder == order;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          setState(() {
            if (isSelected) {
              selectedOrder = null; // Deselect if already selected
            } else {
              selectedOrder = order; // Select the tapped order
              if (!isExpanded) {
                expandedOrders.add(order.hashCode); // Expand the card if not expanded
              }
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120, // Adjust the height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(order.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medicine: ${order.medicineName}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Order #${order.orderNumber}'),
                  if (isSelected && !isConfirmed) // Show user's name only if selected and not confirmed
                    SizedBox(height: 8),
                  Text(
                    'User: ${order.user.name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('User Details'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ${order.user.name}'),
                                    Text('Phone Number: ${order.user.phoneNumber}'),
                                    Text('Address: ${order.user.address}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Details',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      if (!isConfirmed)
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                confirmPendingOrder(order);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 0, 136, 102).withOpacity(0.7),
                              ),
                              child: Text(
                                'Confirm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                cancelPendingOrder(order);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      if (isConfirmed) // Show "Unconfirm" button for confirmed orders
                        ElevatedButton(
                          onPressed: () {
                            unconfirmConfirmedOrder(order);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          child: Text(
                            'Unconfirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderList(List<Order> orders, bool isConfirmed) {
    return orders.isEmpty
        ? Center(child: Text(isConfirmed ? 'No confirmed orders' : 'No pending orders'))
        : ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return buildOrderCard(orders[index], isConfirmed);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Processing'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color.fromARGB(255, 0, 136, 102),
          labelColor: Color.fromARGB(255, 0, 136, 102),
          tabs: [
            Tab(text: 'Pending'),
            Tab(text: 'Confirmed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildOrderList(pendingPrescriptionOrders, false),
          buildOrderList(confirmedPrescriptionOrders, true),
        ],
      ),
    );
  }
}

enum OrderStatus {
  pending,
  confirmed,
}

class User {
  final String name;
  final String phoneNumber;
  final String address;

  User({required this.name, required this.phoneNumber, required this.address});
}

class Order {
  String orderNumber;
  final String medicineName;
  final String image;
  final User user;
  OrderStatus status;

  Order({
    required this.orderNumber,
    required this.medicineName,
    required this.image,
    required this.user,
    required this.status,
  });
}
