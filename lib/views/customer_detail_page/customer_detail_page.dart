import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/extensions.dart'; // Ensure this import is correct
import 'package:invoice_generator/utils/globals.dart'; // Import globals file

class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({super.key});

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  String? name, contact;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Customer Details"),
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
                      initialValue: Globals.customer_name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter Customer name !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.customer_name = val;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Customer name",
                        hintText: "Enter name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //contact
                    TextFormField(
                      initialValue: Globals.customer_contact,
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
                        Globals.customer_contact = val;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Customer contact",
                        hintText: "Enter number ",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    30.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.reset();
                            Globals.customer_contact =
                                Globals.customer_name = null;
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
