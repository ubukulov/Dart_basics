class User {
  String email = 'test@mail.ru';
  late String name;

  User(this.name, this.email);
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
  AdminUser(String name, String email) : super(name, email);
}

class UserManager<T extends User, A extends AdminUser> {
  List users = [];

  // По умолчанию БД список пользователей
  UserManager(String name, String email) {
    users.add(User(name, email));
  }

  void addAdmin(A admin) {
    users.add(admin);
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
      if (users[i] is AdminUser) {
        usersEmail.add(getMailSystem(users[i].email));
      } else {
        usersEmail.add(users[i].email);
      }
    }

    return usersEmail;
  }

  String getMailSystem(String email) {
    int pos = email.indexOf('@');

    if (pos == -1) {
      throw Exception("Символ @ не найден в строке");
    }

    return email.substring(pos + 1);
  }
}
