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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Company Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //name
                    TextFormField(
                      initialValue: Globals.company_name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter company name !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.company_name = val;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Company name",
                        hintText: "Enter name",
                        prefixIcon: const Icon(Icons.apartment_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //contact
                    TextFormField(
                      initialValue: Globals.company_contact,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter number !!";
                        } else if (val.length < 10) {
                          return "Contact number must be of 10 digits !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.company_contact = val;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Company contact",
                        hintText: "Enter number ",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //institute
                    TextFormField(
                      initialValue: Globals.company_address,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter addres !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.company_address = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Company address",
                        hintText: "Enter address",
                        prefixIcon: const Icon(Icons.school_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    30.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.reset();

                            Globals.company_address = Globals.company_contact =
                                Globals.company_name = null;
                            setState(() {});
                          },
                          child: const Text("RESET"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bool validated = formKey.currentState!.validate();

                            if (validated) {
                              formKey.currentState!.save();

                              SnackBar snackBar = const SnackBar(
                                content: Text("Form saved successfully...!!"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              SnackBar snackBar = const SnackBar(
                                content: Text("Form submission failed...!!"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text("SAVE"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
