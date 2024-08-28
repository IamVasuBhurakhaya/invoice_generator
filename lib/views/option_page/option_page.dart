import 'package:flutter/material.dart';
import 'package:invoice_generator/routes/appRoutes.dart';
import 'package:invoice_generator/utils/extensions.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.companyDetailPage);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffb79ced),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.apartment_rounded,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                20.w,
                const Text(
                  ":",
                  style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                20.w,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.companyDetailPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      // width: 210,
                      decoration: const BoxDecoration(
                        color: Color(0xffb79ced),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Company Detail",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            40.h,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.customerDetailPage);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffb79ced),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                20.w,
                const Text(
                  ":",
                  style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                20.w,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.customerDetailPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      // width: 210,
                      decoration: const BoxDecoration(
                        color: Color(0xffb79ced),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Customer Detail",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            40.h,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.productDetailPage);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffb79ced),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                20.w,
                const Text(
                  ":",
                  style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                20.w,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.productDetailPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      // width: 210,
                      decoration: const BoxDecoration(
                        color: Color(0xffb79ced),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Product Detail",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.pdfPage);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xffb79ced),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.picture_as_pdf_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
                10.w,
                const Text(
                  ":",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                10.w,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.pdfPage);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 240,
                    decoration: const BoxDecoration(
                      color: Color(0xffb79ced),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Generate Invoice",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
