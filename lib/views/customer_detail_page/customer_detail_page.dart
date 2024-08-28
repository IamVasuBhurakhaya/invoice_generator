import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/extensions.dart';
import 'package:invoice_generator/utils/globals.dart';

class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({super.key});

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  String? name, contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (val) {
                    name = val;
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Customer Name",
                    hintText: "Enter name",
                    prefixIcon: Icon(Icons.apartment_rounded),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10), // Use SizedBox for spacing
                TextFormField(
                  onChanged: (val) {
                    contact = val;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Customer Contact",
                    hintText: "Enter number",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Globals.customer_name = name;
          Globals.customer_contact = contact;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data saved successfully')),
          );
        },
        label: Text("Save"),
      ),
    );
  }
}
