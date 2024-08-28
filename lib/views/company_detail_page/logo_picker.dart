// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:invoice_generator/utils/globals.dart';
//
// class LogoPicker extends StatefulWidget {
//   const LogoPicker({super.key});
//
//   @override
//   State<LogoPicker> createState() => _LogoPickerState();
// }
//
// class _LogoPickerState extends State<LogoPicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Logo Picker"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             color: Color(0xffE9EDC9),
//             borderRadius: BorderRadius.all(
//               Radius.circular(16),
//             )),
//         padding: const EdgeInsets.all(16),
//         width: double.infinity,
//         height: MediaQuery.sizeOf(context).height * 0.30,
//         alignment: Alignment.center,
//         child: Stack(
//           alignment: Alignment.bottomRight,
//           children: [
//             CircleAvatar(
//               radius: 90,
//               backgroundColor: const Color(0xffFAEDCD),
//               foregroundImage:
//                   Globals.image != null ? FileImage(Globals.image!) : null,
//               child: Globals.image == null
//                   ? const Text(
//                       "Add Image",
//                       style: TextStyle(fontSize: 20, color: Colors.black54),
//                     )
//                   : null,
//             ),
//             FloatingActionButton.small(
//               splashColor: const Color(0xfffefae0),
//               backgroundColor: const Color(0xffe9edc9),
//               onPressed: () async {
//                 final ImagePicker imagePicker = ImagePicker();
//                 final source = await showDialog<ImageSource>(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       backgroundColor: const Color(0xffe9edc9),
//                       title: const Text(
//                         "Choose Image Source",
//                         style: TextStyle(
//                             color: Colors.black54, fontWeight: FontWeight.w700),
//                       ),
//                       actions: <Widget>[
//                         ElevatedButton(
//                           child: const Text("Camera"),
//                           onPressed: () {
//                             Navigator.of(context).pop(ImageSource.camera);
//                           },
//                         ),
//                         ElevatedButton(
//                           child: const Text("Gallery"),
//                           onPressed: () {
//                             Navigator.of(context).pop(ImageSource.gallery);
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//
//                 if (source != null) {
//                   final XFile? file =
//                       await imagePicker.pickImage(source: source);
//                   if (file != null) {
//                     setState(() {
//                       Globals.image = File(file.path);
//                     });
//                   }
//                 }
//               },
//               child: const Icon(
//                 Icons.add_rounded,
//                 size: 34,
//                 color: Colors.black54,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
