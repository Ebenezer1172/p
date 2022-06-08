import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note/user_notifier.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({Key? key}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> { 
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserNotifier>(context); 
    final noteList = provider.userList;

    return noteList.isEmpty
        ? const Center(
            child: Text(
            'No New Notes',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue),
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
                    child: Card( 
                      color: Colors.blue, 
                      child: InkWell(
                        splashColor:const Color.fromARGB(255, 255, 255, 255),
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
                                            children: const [],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      '/editionscreen');
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.green,
                                                )),
                                            Checkbox(
                                                value: note.isDone,
                                                onChanged: (_) {
                                                  provider =
                                                      Provider.of<UserNotifier>(
                                                          context,
                                                          listen: false);
                                                  // var isDone = 
                                                  provider
                                                      .toggleUserStatus(note);
                                                }),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                provider.deleteUser(index);
                                              },
                                              icon: const Icon(
                                                  Icons.delete_forever),
                                            ),
                                          ]),
                                    ),
                                    Text(
                                      'Title: ' + note.title,
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
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
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
