// import 'package:flutter/material.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
// import 'package:your_notes/Notes/model%20/note.dart';

// import '../service/db_service.dart';

// class BoxLayout extends StatefulWidget {
//   @override
//   _BoxLayoutState createState() => _BoxLayoutState();
// }

// class _BoxLayoutState extends State<BoxLayout> {
//   late List<Note> notes;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     refreshNotes();
//   }

//   @override
//   void dispose() {
//     NotesDatabase.instance.close();
//     super.dispose();
//   }

//   Future refreshNotes() async {
//     setState(() => isLoading = true);
//     this.notes = await NotesDatabase.instance.readAllNotes();
//     setState(() {
//       isLoading = false;
//     });
//   }
// @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white24,
//         appBar: AppBar(
//           flexibleSpace: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               MaterialButton(
//                 onPressed: () {},
//                 child: Text("Add notes"),
//               ),
//               MaterialButton(
//                 onPressed: () {},
//                 child: Text("Fetch notes"),
//               ),
//             ],
//           ),
//         ),
//         body: Container(
//           margin: EdgeInsets.all(12),
//           child: StaggeredGridView.countBuilder(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 12,
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: Colors.yellow,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [Text(" notes"), Icon(Icons.edit)],
//                         ),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: "jo maan meh wo lekho",
//                           ),
//                         ),
//                         Text(DateTime.now().toString())
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               staggeredTileBuilder: (index) {
//                 return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
//               }),
//         ),
//       ),
//     );
//   }
// }
