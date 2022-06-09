import 'dart:math';

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
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.green),
            ),
          )

       : ListView.separated(
            separatorBuilder: ((context, index) => Container(
                  color: Colors.green,
                  height: 1,
                )),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            // shrinkWrap: true,
            itemCount: noteList.length,
            itemBuilder: (BuildContext context, index) {
              final note = noteList[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  child: Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
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
                              Text(
                                note.title,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                note.note,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              );
            });
  }
}