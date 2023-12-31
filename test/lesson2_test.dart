import 'package:lesson2/fine_numbers.dart';
import 'package:lesson2/user_class.dart';
import 'package:lesson2/point_class.dart';

/*
СПИСОК ЗАДАЧ
1. Реализуйте методы вычисления НОД и НОК целых чисел. Реализуйте метод, который разбивает число на простые множители и возвращает их.
2. Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.
3. Реализуйте метод, который принимает строку слов, разделённых пробелами. Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
4. Есть коллекция слов. Реализуйте метод, возвращающий Map. Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
5. Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого. Реализуйте метод, возвращающий цифры без повторений, которые встречаются в данной строке. Однако цифры встречаются в виде английских слов от zero до nine. Например, в результате строки ‘one, two, zero, zero’ мы получим следующий результат: [1, 2, 0]. Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.
6. Реализуйте класс Point, который описывает точку в трёхмерном пространстве. У данного класса реализуйте метод distanceTo(Point another), который возвращает расстояние от данной точки до точки в параметре. По желанию можете реализовать метод, принимающий три точки в трёхмерном пространстве и возвращающий площадь треугольника, который образуют данные точки. Реализуйте factory-конструкторы для данного класса, возвращающие начало координат, и ещё несколько на своё усмотрение (например, конструктор, возвращающий точку с координатами [1,1,1], которая определяет единичный вектор).
7. Реализуйте метод, который вычисляет корень любой заданной степени из числа. Реализуйте данный метод как extension-метод для num. Алгоритм можете взять на википедии как «Алгоритм нахождения корня n-й степени». Запрещается использовать методы math. В случае когда значение вернуть невозможно, необходимо бросать исключение с описанием ошибки.
8. Создайте класс User, у которого есть поле email. Реализуйте два наследника данного класса AdminUser и GeneralUser. Реализуйте mixin над классом User, у которого будет метод getMailSystem, который возвращает значение из email, которое находится после @. Например, если email пользователя user@mail.ru, то данный метод вернёт mail.ru. Используйте данный миксин на AdminUser. Далее реализуйте класс UserManager<T extends User>, у которого будет храниться список пользователей и будут методы добавления или удаления их. Также в UserManager реализуйте метод, который выведет почту всех пользователей, однако если пользователь admin, будет выведено значение после @. Проверьте реализованные методы на практике.
*/

void main() {
  var num = Number();
  var a = 16;
  var b = 8;
  var nod = num.getNOD(a, b);
  print('Задача №1.');
  print('Параметры: a=$a, b=$b. НОД: $nod');

  a = 27;
  b = 24;
  var nok = num.getNOK(27, 24);
  print('Параметры: a=$a, b=$b. НОК: $nok');

  a = 16;
  var l = num.getPrimeFactors(16);
  print('Параметры: a=$a. Простые множители: $l');

  print('----------------------------------------------------');
  print('Задача №2.');
  a = 10;
  var bin = num.convertDecimalToBinary(a);
  print('Параметры: a=$a. Двоичной: $bin');
  var dec = num.convertBinaryToDecimal(bin);
  print('Параметры: Двоичный=$bin. Десяточный: $dec');

  print('----------------------------------------------------');
  print('Задача №3.');
  var str = 'sadasda3 3asdasd4 df3asd4';
  var numCollection = num.getNumbersFromString(str);
  print('Параметры: Строка=$str. Коллекция: $numCollection');

  print('----------------------------------------------------');
  print('Задача №4.');
  List<String> list = ['Hello', 'World!', 'Football', 'Basketball'];
  var m = num.getListMap(list);
  print('Параметры: Коллекция(List)=$list. Коллекция(Map): $m');

  print('----------------------------------------------------');
  print('Задача №5.');
  List list2 = [
    'one',
    'cat',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'zero',
    'five',
    'dog'
  ];
  var numsList = num.getNumsWithoutRepeat(list2);
  print('Параметры: Коллекция(List)=$list2. Коллекция(Set): $numsList');

  print('----------------------------------------------------');
  print('Задача №6.');
  var point = Point.zero();
  var distance = point.distanceTo(Point(2, 2, 2));
  print('Параметры: x1,y1,z1 = 1, x2,y2,z2 = 2. Расстояние: $distance');

  print('----------------------------------------------------');
  print('Задача №7.');
  a = 27;
  var power = 3;
  var n = a.root(power);
  print('Параметры: Цифр: $a, Степень: $power. Результат: $n');

  print('----------------------------------------------------');
  print('Задача №8.');
  var name = 'Admin';
  var email = 'admin2123@test.com';
  var adminUser = AdminUser(name, email);
  var adminEmail = adminUser.getMailSystem();
  print('Параметры: Email: $email. Результат: $adminEmail');

  var userManager = UserManager(User('user1', 'user1@test.com'));
  userManager.addUser(adminUser);
  
  for (int i = 0; i < userManager.users.length; i++) {
    var e = userManager.users[i].email;
    print('Пользовател №$i: $e');
  }

  print('----------------------------------------------------');
  name = 'User4';
  email = 'user4@test.com';
  var user = User(name, email);
  print('Добавляю нового пользователя. Name=$name, Email: $email');
  userManager.addUser(user);
  for (int i = 0; i < userManager.users.length; i++) {
    var e = userManager.users[i].email;
    print('Пользовател №$i: $e');
  }

  print('----------------------------------------------------');
  email = 'user2@test.com';
  print('Удаляю пользователя. Email: $email');
  userManager.removeUser(email);
  for (int i = 0; i < userManager.users.length; i++) {
    var e = userManager.users[i].email;
    print('Пользовател №$i: $e');
  }

  print('----------------------------------------------------');
  print('Вывожу email всех пользователей...');
  print(userManager.getUsersEmail());
}
