import 'package:flutter/cupertino.dart';

import 'user.dart';

class UserNotifier extends ChangeNotifier {
  final TextEditingController _note = TextEditingController();
  final TextEditingController _titlee = TextEditingController();
  final TextEditingController _name = TextEditingController();
  TextEditingController get titlee => _titlee;
  TextEditingController get note => _note;
  TextEditingController get name => _name;
  bool isDone = false;
  List<User> _userlist = [];
  List<User> get userList => _userlist;

  List<User> get users =>
      _userlist.where((userList) => userList.isDone == false).toList();

  List<User> get userListFavourites =>
      _userlist.where((userList) => userList.isDone == true).toList();

  final String _names = '';
  String get names => _names;

  bool toggleUserStatus(User user) {
    user.isDone = !user.isDone;
    notifyListeners();

    return user.isDone;
  }

  addUser(User user) {
    _userlist.add(user);
    notifyListeners();
  }

  clear() {
    _note.clear();
    _titlee.clear();
  }

// addUser(User user)=> FirebaseApi.createNote(user);

  deleteUser(index) {
    _userlist.removeWhere((_user) =>
        _user.title ==
        userList[index].title); // change it from _user.note to _user.title
    notifyListeners();
  }

  void setNotes(List<User> user) => _userlist = userList;

  void setNotess(List<User> userList) =>
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _userlist = userList;
// @override
        notifyListeners();
      });

  favouriteNote(User user) {
    _userlist.add(user);
    notifyListeners();
  }

  void updateNotes(User user, String title, String note) {
    user.title = title;
    user.note = note;
    notifyListeners();
  }
}



