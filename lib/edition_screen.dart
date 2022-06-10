// import 'package:flutter/material.dart';
// import 'package:note/firebase_api.dart';
// import 'package:provider/provider.dart';
// import 'package:note/user_notifier.dart';
// import 'package:note/homepage.dart';  
// import 'package:note/user.dart';



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import '../../Models/Note.dart';
// import '../../Widgets/utils_snackbar.dart';

// class NoteEditingPage extends StatefulWidget {
//   final Map note;
//   const NoteEditingPage({Key? key, required this.note}) : super(key: key);

//   @override
//   State<NoteEditingPage> createState() => _NoteEditingPageState();
// }

// class _NoteEditingPageState extends State<NoteEditingPage> {
//   final reference = FirebaseFirestore.instance.collection("notes").doc();
//   String title = '';
//   String description = '';
//   final TextEditingController controllerBody = TextEditingController();
//   final TextEditingController controllerTitle = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool starFavorite = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     title = widget.note['title'];
//     description = widget.note['description'];
//     return Form(
//       key: _formKey,
//       child: Scaffold(
//         backgroundColor: HexColor("FFFFFF"),
//         appBar: AppBar(
//           title: TextFormField(
//             // validator: ,
//             // controller: controllerTitle,
//             initialValue: title,
//             onChanged: (value) {
//               setState(() {
//                 title = value;
//               });
//             },
//             onSaved: (value) {
//               setState(() {
//                 title = value!;
//               });
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return "can't be empty";
//               } else {
//                 return null;
//               }
//             },
//             style: TextStyle(fontSize: 27, color: Colors.green),
//             decoration: const InputDecoration(
//               hintText: "Title...",
//               border: InputBorder.none,
//               hintStyle: TextStyle(
//                 fontSize: 27,
//               ),
//             ),
//             // onSaved: (value) {},
//           ),
//           backgroundColor: HexColor("FFFFFF"),
//           elevation: 2,
//           toolbarHeight: 50,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   updateNote(
//                       update: Note(
//                           isFavorite: false,
//                           timeAdded: DateTime.now().toString(),
//                           body: description,
//                           title: title,
//                           email: FirebaseAuth.instance.currentUser!.email,
//                           id: widget.note['id']));
//                   Navigator.pop(context);
//                 } else {
//                   return;
//                 }
//               },
//               icon: const Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.black,
//               )),

//           actions: [
//             IconButton(
//                 icon: const Icon(
//                   Icons.save_as_outlined,
//                 ),
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     updateNote(
//                         update: Note(
//                             isFavorite: false,
//                             timeAdded: DateTime.now().toString(),
//                             body: description,
//                             title: title,
//                             email: FirebaseAuth.instance.currentUser!.email,
//                             id: widget.note['id']));
//                     Navigator.pop(context);
//                   } else {
//                     return;
//                   }
//                 }),
//             const SizedBox(
//               width: 21,
//             ),
//           ],
//           //Font to use, SemiBold, regular,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 style: TextStyle(fontSize: 20, color: HexColor("000000")),
//                 maxLines: null,
//                 // validator: ,
//                 // controller: controllerBody,
//                 initialValue: description,
//                 onChanged: (value) {
//                   setState(() {
//                     description = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "can't be empty";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     description = value!;
//                   });
//                 },
//                 expands: false,
//                 decoration: const InputDecoration(
//                   hintStyle: TextStyle(
//                     fontSize: 20,
//                   ),
//                   border: InputBorder.none,
//                   hintText: "Type something...",
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future updateNote({
//     required Note update,
//   }) async {
//     final docNote =
//         FirebaseFirestore.instance.collection('notes').doc(widget.note['id']);

//     await docNote.update(update.toJson());
//   }

//   //Add to Favorites Method
//   Future addToFavorites() async {
//     final docNote = FirebaseFirestore.instance
//         .collection('notes')
//         .doc(FirebaseAuth.instance.currentUser!.email);
//     final favDocNote =
//         docNote.collection('favorite notes').doc(widget.note['id']);
//     final favNote = Note(
//         isFavorite: false,
//         timeAdded: DateTime.now().toString(),
//         body: description,
//         title: title,
//         id: docNote.id,
//         email: FirebaseAuth.instance.currentUser!.email);

//     final json = favNote.toJson();
//     await favDocNote.set(json);

//     Utils.showSnackBar('Added to Favorites!');
//   }
// }






















// class EditionScreen extends StatefulWidget {
//   const EditionScreen({Key? key}) : super(key: key);

//   @override
//   State<EditionScreen> createState() => _EditionScreenState();
// }

// class _EditionScreenState extends State<EditionScreen> {
//   bool edit = false;
//   // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   String title = '';
//   String note = '';
//   DateTime createdTime= DateTime.now();
//   bool isDone= true;
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<UserNotifier>(context);
//     return Scaffold(
//       floatingActionButton: edit
//           ? FloatingActionButton(
//               onPressed: () {},
//               child: const Icon(Icons.save),
//             )
//           : null,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back)),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 edit = !edit;
//               });
//             },
//             icon: const Icon(Icons.edit),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/home');
//               Navigator.pop(context);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const Home()));
//               Navigator.pushNamed(context, '/home');
//               // if (!_formkey.currentState!.validate()) {
//               //   return;
//               // }
//               // _formkey.currentState!.save();
//               provider.addUser(User(title, note , id ,createdTime,isDone));
//               provider.clear();
//             },
//             icon: const Icon(Icons.add),
//           )
//         ],
//         title: const Text('Edit note'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.amber,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 child: Center(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: provider.titlee,
//                           // initialValue:  context.watch<UserNotifier>().titlee.text,
//                           // onChanged: (_val) {
//                           //   title = _val;
//                           // },
//                           maxLines: 2,
//                           autocorrect: true,
                          
//                           decoration: const InputDecoration.collapsed( 
//                             hintText: ('Title'),
//                           ),
//                           style: const TextStyle(
//                             fontSize: 32,
//                           ),
//                           // validator: (value) {
//                           //   if (value.toString().isEmpty) {
//                           //     return 'Chey your brain dinnor tell you that you should fill it ni?';
//                           //   }
//                           //   return null;
//                           // },
//                         ),
//                         //  const SizedBox(height: 1,),
//                         TextFormField(
//                           controller: provider.note,
//                           // initialValue: context.read<UserNotifier>().note.text,
//                           onChanged: (_val) {
//                             note = _val;
//                           },
//                           maxLines: 50,
//                           autocorrect: true, 
//                           decoration: const InputDecoration.collapsed(
//                             hintText: ('Notes'),
//                           ),
//                           style: const TextStyle(
//                             fontSize: 25,
//                           ), 
//                         ),  
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }