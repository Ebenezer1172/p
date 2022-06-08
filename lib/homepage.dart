import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note/card.dart';
import 'package:note/favourites.dart';
import 'package:note/user_notifier.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String title = '';
  String note = '';
  @override
  Widget build(BuildContext context) {
    final tabs = [
    const   Expanded(
        child:  ListBuilder(),
      ),
      const  Expanded(child: Favourites()),
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: Colors.blue,
            backgroundColor: Colors.black,
            elevation: 100,
            splashColor: Colors.white,
            child: Column(
              children: const [
                Icon(Icons.add),
                Text('  New  '),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/viewscreen');
            }),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 50,
          selectedFontSize: 15,
          unselectedFontSize: 13,
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.blue,
          items: (const [
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              label: 'Notes',
              icon: Icon(
                Icons.note_alt,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: 'Favourites',
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
            ),
          ]),
          currentIndex: _selectedIndex,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Welcome  ${context.watch<UserNotifier>().titlee.text} ',
                            style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          // Text(
                          //   provider.name.text,
                          //   style: const TextStyle(
                          //       fontSize: 35, color: Colors.white),
                          // )
                        ],
                      ),
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    tabs[_selectedIndex],
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        );
  }
}
