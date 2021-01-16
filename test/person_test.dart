import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/person.dart';

void main() {
  group("Mengecek class Person", () {
    Person p;
    p = Person();
    test("Inisialisasi Objek Person", () {
      expect(p.name, equals("no name"));
      expect(p.age, equals(0));
    });

    test("Age harus positif", () {
      p.age = -5;
      expect(p.age, isPositive);
    });
  });
}
