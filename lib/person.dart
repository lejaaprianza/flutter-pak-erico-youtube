// // import 'dart:math';

// // class Person {
// //   String name;
// //   int _age;
// //   List<int> luckyNumbers;

// //   int get age => _age;
// //   set age(int value) {
// //     if (value < 0) {
// //       value *= -1;
// //     }
// //     _age = value;
// //   }

// //   Person() {
// //     name = "no name";
// //     age = 0;
// //     Random r = Random();
// //     luckyNumbers = [];
// //     for (int i = 0; i < 3; i += 1) {
// //       luckyNumbers.add(r.nextInt(11));
// //     }
// //   }
// // }

// // import 'package:equatable/equatable.dart';

// // class Person extends Equatable {
// //   String name;
// //   int age;

// //   Person({this.name = "no name", this.age = 0});

// //   @override
// //   // TODO: implement props
// //   List<Object> get props => [name, age];

// // @override
// // operator ==(other) {
// //   if (other is Person) {
// //     if (name == other.name && age == other.age) {
// //       return true;
// //     }
// //     return false;
// //   }
// // }
// // }

// import 'package:equatable/equatable.dart';

// class Person extends Equatable {
//   final int id;
//   final String name;
//   final int age;

//   Person({this.id, this.name, this.age});

//   factory Person.fromJson(Map<String, dynamic> json) {
//     return Person(
//       id: json['id'],
//       name: json['name'],
//       age: json['age'],
//     );
//   }

//   @override
//   // TODO: implement props
//   List<Object> get props => [id, name, age];
// }
