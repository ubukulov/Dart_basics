class Number {
  // late int a;
  // late int b;

  // Number(this.a, this.b);

  // Задача №1. Возвращает НОД
  int getNOD(int a, int b) {
    var x = a;
    var y = b;
    while (x != y) {
      if (x > y) {
        x = x - y;
      } else {
        y = y - x;
      }
    }

    return x;
  }

  // Задача №1. Возвращает НОК
  int getNOK(int a, int b) {
    List<int> listA = [];
    List<int> listB = [];
    int i = 1;
    while (a >= i) {
      int s = a * i;
      listA.add(s);
      i++;
    }

    int j = 1;
    while (b >= j) {
      int s = b * j;
      listB.add(s);
      j++;
    }

    var list = listA.where((e) {
      return listB.contains(e);
    });

    return list.first;
  }

  // Задача №1. Разбивает число на простые множители и возвращает их
  List getPrimeFactors(int a) {
    List<int> list = [1];
    double x = a.toDouble();

    for (int i = 2; i <= x / i; i++) {
      while (x % i == 0) {
        list.add(i);
        x = x / i;
      }
    }

    if (x > 1) {
      list.add(x.toInt());
    }

    return list;
  }

  // Задача №2. конвертирует десятичной в двоичную
  String convertDecimalToBinary(int a) {
    return a.toRadixString(2);
  }

  // Задача №2. конвертирует наоборот
  int convertBinaryToDecimal(String binary) {
    return int.parse(binary, radix: 2);
  }

  // Задача №3. Принимает строки с цифрами разделенной с пробелами и возращает лист только с цифрами
  List getNumbersFromString(String str) {
    List<String> strList = str.split(' ');
    List<int> numList = [];
    for (int i = 0; i < strList.length; i++) {
      numList.add(int.parse(strList[i].replaceAll(RegExp('[^0-9]'), '')));
    }

    return numList;
  }

  // Задача №4. Как я понял так и реализовал :)
  Map getListMap<T>(List<String> list) {
    Map<String, int> mapList = {};
    for (int i = 0; i < list.length; i++) {
      mapList[list[i]] = list[i].length;
    }

    return mapList;
  }

  // Задача №5.
  Set getNumsWithoutRepeat<T>(List list) {
    var needSets = <int>{};
    for (int i = 0; i < list.length; i++) {
      switch (list[i].toString().toLowerCase()) {
        case 'one':
          needSets.add(1);
          break;
        case 'two':
          needSets.add(2);
          break;
        case 'three':
          needSets.add(3);
          break;
        case 'four':
          needSets.add(4);
          break;
        case 'five':
          needSets.add(5);
          break;
        case 'six':
          needSets.add(6);
          break;
        case 'seven':
          needSets.add(7);
          break;
        case 'eight':
          needSets.add(8);
          break;
        case 'nine':
          needSets.add(9);
          break;
        case 'zero':
          needSets.add(0);
          break;
      }
    }

    return needSets;
  }
}

// Задача №7
extension GetRoot on num {
  root(int power) {
    double eps = 0.0001;
    double root = this / power;
    double rn = toDouble();
    while (mabs(root - rn) >= eps) {
      rn = toDouble();
      for (int i = 1; i < power; i++) {
        rn = rn / root;
      }
      root = 0.5 * (rn + root);
    }

    return root;
  }

  double mabs(double x) {
    return (x < 0) ? -x : x;
  }
}
