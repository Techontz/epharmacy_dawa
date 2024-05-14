import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items; // Add this parameter

  const CheckoutScreen({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: CheckoutBody(items: items), // Pass the items to CheckoutBody
    );
  }
}

class CheckoutBody extends StatefulWidget {
  final List<Map<String, dynamic>> items; // Add this parameter

  const CheckoutBody({Key? key, required this.items}) : super(key: key);

  @override
  _CheckoutBodyState createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildOrderSummary(),
            const SizedBox(height: 20),
            const Text(
              'Shipping Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildShippingForm(),
            const SizedBox(height: 20),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPaymentMethods(),
            const SizedBox(height: 20),
            _buildTotalPrice(),
            const SizedBox(height: 20),
            _buildPlaceOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    // Use the items passed to the widget
    return Column(
      children: widget.items
          .map(
            (item) => ListTile(
          title: Text(item['name']),
          trailing: Text("\Tsh ${item['price']}"),
        ),
      )
          .toList(),
    );
  }

  Widget _buildShippingForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Full Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Address'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'City'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your city';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Postal Code'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your postal code';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      children: [
        RadioListTile(
          title: const Text('Credit Card'),
          value: 'credit_card',
          groupValue: 'payment_method',
          onChanged: (value) {},
        ),
        RadioListTile(
          title: const Text('PayPal'),
          value: 'paypal',
          groupValue: 'payment_method',
          onChanged: (value) {},
        ),
        RadioListTile(
          title: const Text('Cash on Delivery'),
          value: 'cod',
          groupValue: 'payment_method',
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildTotalPrice() {
    final totalPrice = widget.items.fold(
      0.0,
          (sum, item) => sum + item['price'],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "\Tsh ${totalPrice.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPlaceOrderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Proceed with placing the order
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Order placed successfully')),
            );
          }
        },
        child: const Text('Place Order'),
      ),
    );
  }
}
