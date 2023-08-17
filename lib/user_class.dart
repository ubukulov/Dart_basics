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

// class GeneralUser extends User {

// }

class UserManager<T> {
  List users = <T>[];

  // По умолчанию БД список пользователей
  UserManager() {
    users.addAll([User('admin', 'admin323@test.com')]);
    users.addAll([User('User1', 'user1@test.com')]);
    users.addAll([User('User2', 'user2@test.com')]);
    users.addAll([User('User3', 'user3@test.com')]);
  }

  // Добавляет пользователя в коллекцию
  void addUser(String name, String email) {
    users.addAll([User(name, email)]);
  }

  // Удалять по Email из коллекцию
  void removeUser(String email) {
    users.removeWhere((item) => item.email == email);
  }

  // Возвращает коллекцию Email всех пользователей
  List getUsersEmail() {
    List usersEmail = [];
    for (int i = 0; i < users.length; i++) {
      if (users[i].name == 'admin') {
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
