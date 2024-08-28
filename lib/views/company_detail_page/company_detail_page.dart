import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/extensions.dart';
import 'package:invoice_generator/utils/globals.dart';

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({super.key});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  List<Map> CompDetail = [
    {},
  ];
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
          child: Column(
            children: CompDetail.map((e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            e['company_name'] = val;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Company Name",
                            hintText: "Enter name",
                            prefixIcon: Icon(Icons.apartment_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        10.h,
                        TextFormField(
                          onChanged: (val) {
                            e['contact'] = val;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Company Contact",
                            hintText: "Enter number",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        10.h,
                        TextFormField(
                          onChanged: (val) {
                            e['address'] = val;
                          },
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: "Company Address",
                            hintText: "Enter address",
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            CompDetail.removeAt(CompDetail.indexOf(e));
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
              CompDetail.add({});
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
              Globals.allCompanyDetail.clear();
              Globals.allCompanyDetail = CompDetail;
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
