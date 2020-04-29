import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void _register(User user) {
    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception('A user with this name already exists');
    }
  }

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    _register(user);
  }

  User getUserByLogin(login) {
    if (users.containsKey(login)) {
      return users[login];
    } else {
      throw Exception('User is not found');
    }
  }

  User registerUserByPhone(String name, String phone) {
    User user = User(name: name, phone: phone);
    _register(user);
    return user;
  }

  User registerUserByEmail(String name, String email) {
    User user = User(name: name, email: email);
    _register(user);
    return user;
  }

  void setFriends(String login, List<User> friends) {
    if (!users.containsKey(login)) {
      throw Exception('No user with this name exists');
    } else {
      users[login].friends = friends;
    }
  }

  User findUserInFriends(String fullName, User user) {
    if (!users.containsKey(fullName)) {
      throw Exception('No user with this name exists');
    }
    if (!users[fullName].friends.contains(user)) {
      throw Exception('${user.login} is not a friend of the $fullName');
    }
    return users[fullName].friends.firstWhere((f) => f==user);
  }

  List<User> importUsers(List<String> users_data) {
    List<User> list = <User>[];
    users_data.forEach((us) {
      List<String> sp = us.split(";");
      User user = User(name: sp[0].trim(), email: sp[1].trim(), phone: sp[2].trim());
      list.add(user);
    });
    return list;
  }
}
