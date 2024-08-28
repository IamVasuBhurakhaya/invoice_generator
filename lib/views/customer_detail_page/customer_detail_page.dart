import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/extensions.dart';
import 'package:invoice_generator/utils/globals.dart';

class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({super.key});

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  List<Map> CustDetail = [
    {},
  ];
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
          child: Column(
            children: CustDetail.map((e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            e['customer_name'] = val;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Customer Name",
                            hintText: "Enter name",
                            prefixIcon: Icon(Icons.apartment_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        10.h,
                        TextFormField(
                          onChanged: (val) {
                            e['customer_contact'] = val;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Customer Contact",
                            hintText: "Enter number",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        10.h,
                        ElevatedButton.icon(
                          onPressed: () {
                            CustDetail.removeAt(CustDetail.indexOf(e));
                            setState(() {});
                          },
                          label: const Text("Remove"),
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              CustDetail.add({});
              setState(() {});
            },
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            label: const Text(
              "Add",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          20.w,
          GestureDetector(
            onTap: () {
              Globals.allCustomerDetail.clear();
              Globals.allCustomerDetail = CustDetail;
            },
            child: Container(
              alignment: Alignment.center,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xffb79ced),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Text(
                "  Save  ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
