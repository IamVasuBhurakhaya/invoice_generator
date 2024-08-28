import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/extensions.dart';
import 'package:invoice_generator/utils/globals.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<Map> ProDetails = [
    {},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: ProDetails.map((e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            e['product_name'] = val;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: "Product Name",
                            hintText: "Enter name",
                            prefixIcon: Icon(Icons.apartment_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        10.h,
                        TextFormField(
                          onChanged: (val) {
                            e['product_price'] = val;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Product Price",
                            hintText: "Enter price",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        10.h,
                        TextFormField(
                          onChanged: (val) {
                            e['product_qty'] = val;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Product Quantity",
                            hintText: "Enter Quantity",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        15.h,
                        ElevatedButton.icon(
                          onPressed: () {
                            ProDetails.removeAt(ProDetails.indexOf(e));
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
              ProDetails.add({});
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
              Globals.allProductDetail.clear();
              Globals.allProductDetail = ProDetails;
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
