class User {
  String email = 'test@mail.ru';
  late String name;
  String type = 'user';

  User(this.name, this.email, this.type);
}

mixin UserMixin on User {
  String getMailSystem() {
    int pos = email.indexOf('@');

    if (pos == -1) {
      throw Exception("Символ @ не найден в строке");
    }

    return email.substring(pos + 1);
  }
}

class AdminUser extends User with UserMixin {
  AdminUser(String name, String email, String type) : super(name, email, type);
}

class UserManager<T extends User> {
  List<T> users = [];

  // По умолчанию БД список пользователей
  UserManager(T user) {
    users.add(user);
  }

  // Добавляет пользователя в коллекцию
  void addUser(T user) {
    users.add(user);
  }

  // Удалять по Email из коллекцию
  void removeUser(String email) {
    users.removeWhere((item) => item.email == email);
  }

  // Возвращает коллекцию Email всех пользователей
  List getUsersEmail() {
    List usersEmail = [];
    for (int i = 0; i < users.length; i++) {
      if (isAdmin(users[i])) {
        usersEmail.add(getMailSystem(users[i].email));
      } else {
        usersEmail.add(users[i].email);
      }
    }

    return usersEmail;
  }

  bool isAdmin(T user){
    return (user.type== 'admin') ? true : false;
  }

  String getMailSystem(String email) {
    int pos = email.indexOf('@');

    if (pos == -1) {
      throw Exception("Символ @ не найден в строке");
    }

    return email.substring(pos + 1);
  }
}
