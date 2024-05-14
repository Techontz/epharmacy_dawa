import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(MaterialApp(
    home: PrescriptionVerificationScreen(),
  ));
}

class PrescriptionVerificationScreen extends StatefulWidget {
  @override
  _PrescriptionVerificationScreenState createState() => _PrescriptionVerificationScreenState();
}

class _PrescriptionVerificationScreenState extends State<PrescriptionVerificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Order> pendingPrescriptionOrders = [
    Order(orderNumber: '1', firstName: 'John', image: 'images/article.jpg', user: User(name: 'John Doe', phoneNumber: '123-456-7890'), status: OrderStatus.pending),
    Order(orderNumber: '2', firstName: 'Jane', image: 'images/article.jpg', user: User(name: 'Jane Smith', phoneNumber: '987-654-3210'), status: OrderStatus.pending),
  ];
  List<Order> confirmedPrescriptionOrders = [];
  List<int> expandedOrders = []; // Track expanded orders
  List<List<OrderField>> fieldLists = []; // Track field lists for each expanded order

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
        content: Text('${order.firstName} confirmed.'),
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
        content: Text('${order.firstName} unconfirmed.'),
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
        content: Text('${order.firstName} canceled.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget buildOrderCard(Order order, bool isConfirmed) {
    bool isExpanded = expandedOrders.contains(order.hashCode);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ExpansionTile(
        key: Key(order.hashCode.toString()),
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            if (expanded) {
              expandedOrders.add(order.hashCode);
              fieldLists.add([OrderField()]); // Add initial field list
            } else {
              expandedOrders.remove(order.hashCode);
              fieldLists.removeWhere((fields) => fields.isNotEmpty);
            }
          });
        },
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(order: order),
              ),
            );
          },
          child: Hero(
            tag: order.image,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset( // Using Image.asset instead of Image.network
                order.image, // Assuming order.image contains 'images/screenshot.png'
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(order.firstName),
        subtitle: Text('Order #${order.orderNumber}'),
        trailing: isConfirmed
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                unconfirmConfirmedOrder(order);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 136, 102).withOpacity(0.7),
              ),
              child: Text(
                'Unconfirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
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
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 0, 136, 102).withOpacity(0.7),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 0, 136, 102).withOpacity(0.7)),
              ),
            ),
          ],
        ),
        children: [
          ListTile(
            title: Text('User: ${order.user.name}'),
            subtitle: Text('Phone: ${order.user.phoneNumber}'),
          ),
          ListTile(
            title: Text('Status: ${order.status == OrderStatus.pending ? 'Pending' : 'Confirmed'}'),
            subtitle: Text('Time: ${DateTime.now().toString()}'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isExpanded ? expandedOrders.remove(order.hashCode) : expandedOrders.add(order.hashCode);
                    });
                  },
                  child: Text(
                    isExpanded ? 'Hide Details' : 'Show Details',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                if (isExpanded)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      buildFields(order, order.hashCode, isConfirmed), // Initial set of fields
                      SizedBox(height: 8),
                      if (!isConfirmed)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              fieldLists[expandedOrders.indexOf(order.hashCode)].add(OrderField()); // Add new field
                            });
                          },
                          child: Text('+ Add Fields'),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFields(Order order, int hashCode, bool isConfirmed) {
    List<OrderField> fields = fieldLists[expandedOrders.indexOf(hashCode)];

    return Column(
      children: List.generate(fields.length, (index) {
        OrderField field = fields[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: field.selectedMedicine,
              onChanged: !isConfirmed
                  ? (newValue) {
                setState(() {
                  field.selectedMedicine = newValue!;
                });
              }
                  : null, // Disable editing for confirmed orders
              items: <String>['Medicine A', 'Medicine B', 'Medicine C']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Medicine',
                border: OutlineInputBorder(),
              ),
              disabledHint: Text(field.selectedMedicine ?? 'Select Medicine'),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: field.selectedDisease,
              onChanged: !isConfirmed
                  ? (newValue) {
                setState(() {
                  field.selectedDisease = newValue!;
                });
              }
                  : null, // Disable editing for confirmed orders
              items: <String>['Disease X', 'Disease Y', 'Disease Z']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Disease',
                border: OutlineInputBorder(),
              ),
              disabledHint: Text(field.selectedDisease ?? 'Select Disease'),
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: field.description,
              readOnly: isConfirmed, // Make description read-only for confirmed orders
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: !isConfirmed
                  ? (value) {
                setState(() {
                  field.description = value;
                });
              }
                  : null, // Disable editing for confirmed orders
            ),
            SizedBox(height: 8),
            if (!isConfirmed)
              TextButton(
                onPressed: () {
                  setState(() {
                    fields.removeAt(index); // Remove field
                  });
                },
                child: Text('Remove'),
              ),
            SizedBox(height: 8),
          ],
        );
      }),
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
        title: Text('Prescription Verification'),
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

  User({required this.name, required this.phoneNumber});
}

class Order {
  String orderNumber;
  final String firstName;
  final String image;
  final User user;
  OrderStatus status;
  List<OrderField> fields = [];

  Order({
    required this.orderNumber,
    required this.firstName,
    required this.image,
    required this.user,
    required this.status,
  });
}

class OrderField {
  String? selectedMedicine;
  String? selectedDisease;
  String? description;
}

class FullScreenImage extends StatelessWidget {
  final Order order;

  const FullScreenImage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: AssetImage(order.image), // Using AssetImage here
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          initialScale: PhotoViewComputedScale.contained,
          heroAttributes: PhotoViewHeroAttributes(tag: order.image),
        ),
      ),
    );
  }
}
