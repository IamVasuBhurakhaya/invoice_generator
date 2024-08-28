import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/extensions.dart'; // Ensure this import is correct
import 'package:invoice_generator/utils/globals.dart'; // Import globals file

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({super.key});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  String? name, contact, address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Details"),
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
                    labelText: "Company Name",
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
                    labelText: "Company Contact",
                    hintText: "Enter number",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10), // Use SizedBox for spacing
                TextFormField(
                  onChanged: (val) {
                    address = val;
                  },
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    labelText: "Company Address",
                    hintText: "Enter address",
                    prefixIcon: Icon(Icons.location_on),
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
          Globals.company_name = name;
          Globals.company_contact = contact;
          Globals.company_address = address;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data saved successfully')),
          );
        },
        label: Text("Save"),
      ),
    );
  }
}
