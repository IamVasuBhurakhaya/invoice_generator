import 'package:flutter/cupertino.dart';
import 'package:invoice_generator/views/company_detail_page/company_detail_page.dart';
import 'package:invoice_generator/views/customer_detail_page/customer_detail_page.dart';
import 'package:invoice_generator/views/home_page/home_page.dart';
import 'package:invoice_generator/views/option_page/option_page.dart';
import 'package:invoice_generator/views/pdf_page/pdf_page.dart';
import 'package:invoice_generator/views/product_detail_page/product_detail_page.dart';
import 'package:invoice_generator/views/splash_screen/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/";
  static String homePage = "home_page";
  static String companyDetailPage = "company_detail_page";
  static String customerDetailPage = "customer_detail_page";
  static String productDetailPage = "product_detail_page";
  static String pdfPage = "pdf_page";
  static String optionPage = "option_page";

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    companyDetailPage: (context) => const CompanyDetailPage(),
    customerDetailPage: (context) => const CustomerDetailPage(),
    optionPage: (context) => const OptionPage(),
    pdfPage: (context) => const PdfPage(),
    productDetailPage: (context) => const ProductDetailPage(),
  };
}
