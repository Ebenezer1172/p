import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note/user_notifier.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserNotifier>(context);
    final noteList = provider.userListFavourites;

    return noteList.isEmpty
        ? const Center(
            child: Text(
            'No Favourite Notes',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blue),
          ),)
        : ListView.separated(
            separatorBuilder: ((context, index) => Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 1,
                )),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            shrinkWrap: true,
            itemCount: noteList.length,
            itemBuilder: (BuildContext context, index) {
              final note = noteList[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blue,
                      child: InkWell(
                        splashColor: const Color.fromARGB(255, 255, 255, 255),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Form(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              //  TextFormField(

                                              //                       autocorrect: true,
                                              //                       controller: _note
                                              //                       //  provider.titlee
                                              //                        ,
                                              //                       decoration: const InputDecoration.collapsed(
                                              //                         hintText: ('Title'),
                                              //                       ),
                                              //                       style: const TextStyle(
                                              //                       ),
                                              //                     ),
                                              // TextFormField(
                                              //   autocorrect: true,
                                              //   // controller: provider.note.text,
                                              //   decoration: const InputDecoration.collapsed(
                                              //     hintText: ('Notes'),
                                              //   ),
                                              //   style: const TextStyle(
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Title: ' + note.title,
                                      softWrap: true,

                                      // note.title ,
                                      // gives us the title for the respective note
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Note: ' + note.note,

                                      // context.read<UserNotifier>().note.text,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Column(children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/editionscreen');
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    )),
                                // Checkbox(value: user.isDone, onChanged:
                                // (){})
                                // IconButton(

                                //   onPressed: () {

                                //       // // context.watch<UserNotifier>().isDone;
                                //       // Provider.of<UserNotifier>(context,listen: false);
                                //       // final isDone = provider.toggleUserStatus(note);

                                //   },
                                //   icon: const Icon(
                                //     Icons.favorite,
                                //     color: Colors.white,
                                //   ),
                                // ),

                                Checkbox(
                                    value: note.isDone,
                                    onChanged: (_) {
                                      provider = Provider.of<UserNotifier>(
                                          context,
                                          listen: false);
                                      //  var isDone =
                                      provider.toggleUserStatus(note);
                                    }),
                                const SizedBox(
                                  width: 1,
                                ),
                                IconButton(
                                  onPressed: () {
                                    provider.deleteUser(index);
                                  },
                                  icon: const Icon(Icons.delete_forever),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
  }
}
