import 'package:flutter/material.dart';
import '../../order_processing/order_processing_screen.dart';

void main() {
  runApp(MaterialApp(
    home: OrderHistoryScreen(),
  ));
}

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget buildOrderList(List<Order> orders, bool isConfirmed) {
    return orders.isEmpty
        ? Center(child: Text(isConfirmed ? 'No order history yet' : 'No order history yet'))
        : ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color.fromARGB(255, 0, 136, 102),
          labelColor: Color.fromARGB(255, 0, 136, 102),
          tabs: const [
            Tab(text: 'OTC Orders'),
            Tab(text: 'Prescription Orders'),
          ],
        ),
      ),
    );
  }
}
