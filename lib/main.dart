//import 'dart:ffi';
//import 'dart:math';
//import 'dart:async';

import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:doc_comment/user_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/color_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'color_bloc.dart';
// import 'package:hello_world/application_color.dart';
// import 'package:hello_world/money.dart';
// import 'package:hello_world/cart.dart';
import 'package:hello_world/product_card.dart';
//import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:hello_world/post_result_model.dart';
//import 'package:hello_world/user_model1.dart';
//port 'package:qrscan/qrscan.dart' as scanner;
//import 'package:flutter/services.dart';
//import 'package:qr_flutter/qr_flutter.dart';
//import 'package:hello_world/colorful_button.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter_gauge/flutter_gauge.dart';
//import 'package:kdgaugeview/kdgaugeview.dart';
//import 'package:syncfusion_flutter_gauges/gauges.dart';

//import 'package:english_words/english_words.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
// void main() {
//   //  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//   //     .then((_) {
//   //   runApp(MyApp());
//   // });
//   runApp(new MyApp());
// }

void main() => runApp(MyApp());
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   HydratedBloc.storage = await HydratedStorage.build();
//   runApp(App());
// }
// void main() async {
//   BlocSupervisor.delegate = await HydratedBlocDelegate.build();
//   runApp(MyApp());
// }

// FLUTTER 52. ListView Builder + BLoC
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          BlocProvider(builder: (context) => ProductBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();
  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff44336),
        title: Text("Demo ListView Builder"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text(
              "Create Products",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              bloc.dispatch(r.nextInt(4) + 2);
            },
            color: Color(0xfff44336),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (index == 0)
                          ? SizedBox(
                              width: 20,
                            )
                          : Container(),
                      ProductCard(
                        imageURL: products[index].imageURL,
                        name: products[index].name,
                        price: products[index].price.toString(),
                        onAddCartTap: () {},
                        onDecTap: () {},
                        onIncTap: () {},
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Product {
  String imageURL;
  String name;
  int price;

  Product({this.imageURL = "", this.name = "", this.price = 0});
}

class ProductBloc extends Bloc<int, List<Product>> {
  @override
  // TODO: implement initialState
  List<Product> get initialState => [];

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    // TODO: implement mapEventToState
    List<Product> products = [];
    for (int i = 0; i < event; i++)
      products.add(Product(
          imageURL:
              "https://5.imimg.com/data5/FJ/HI/MY-8155185/mixed-fruit-flavour-500x500.jpg",
          name: "Produk " + i.toString(),
          price: (i + 1) * 5000));
    yield products;
  }
}

// FLUTTER 51. Hydrated BLoC State Management (gagal)
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider<ColorBloc>(
//         builder: (context) => ColorBloc(),
//         child: MainPage(),
//       ),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
//     return Scaffold(
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             backgroundColor: Colors.amber,
//             onPressed: () {
//               bloc.dispatch(ColorEvent.to_amber);
//             },
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.lightBlue,
//             onPressed: () {
//               bloc.dispatch(ColorEvent.to_light_blue);
//             },
//           )
//         ],
//       ),
//       appBar: AppBar(
//         title: Text("Bloc dengan Flutter_bloc"),
//       ),
//       body: Center(
//         child: BlocBuilder<ColorBloc, Color>(
//           builder: (context, currentColor) => AnimatedContainer(
//             width: 100,
//             height: 100,
//             color: currentColor,
//             duration: Duration(
//               milliseconds: 500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//FLUTTER 50. Flutter 1.9 (SelectableText, ToggleButtons, ColorFiltered)
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<bool> isSelected = [true, false, false];
//   ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ColorFiltered(
//         colorFilter: colorFilter,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Widget Demo GDG 2019 China"),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SelectableText(
//                   "Ini adalah selectable text. Silahkan pilih saya.",
//                   style: TextStyle(fontSize: 20),
//                   showCursor: true,
//                   cursorWidth: 3,
//                   cursorColor: Colors.pink,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 ToggleButtons(
//                   isSelected: isSelected,
//                   children: [
//                     Icon(Icons.access_alarm),
//                     Icon(Icons.adb),
//                     Icon(Icons.add_comment),
//                   ],
//                   onPressed: (index) {
//                     setState(() {
//                       if (index == 0)
//                         colorFilter =
//                             ColorFilter.mode(Colors.blue, BlendMode.screen);
//                       else if (index == 1)
//                         colorFilter =
//                             ColorFilter.mode(Colors.green, BlendMode.softLight);
//                       else
//                         colorFilter =
//                             ColorFilter.mode(Colors.purple, BlendMode.multiply);
//                       for (int i = 0; i < isSelected.length; i++)
//                         isSelected[i] = (i == index) ? true : false;
//                     });
//                   },
//                   fillColor: Colors.red[50],
//                   selectedColor: Colors.red,
//                   selectedBorderColor: Colors.red,
//                   splashColor: Colors.blue,
//                   highlightColor: Colors.yellow,
//                   borderRadius: BorderRadius.circular(15),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//FLUTTER 49. Product Card (BoxShadow, RoundedRectangleBorder)

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: firstColor,
//         ),
//         body: ChangeNotifierProvider(
//           builder: (context) => ProductState(),
//           child: Container(
//             margin: EdgeInsets.all(20),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: Consumer<ProductState>(
//                 builder: (context, productState, _) => ProductCard(
//                   imageURL: "https://image.sciencenorway.no/1438480.jpg",
//                   name: "Buah-buahan mix 1 kg",
//                   price: "Rp25.000",
//                   quantity: productState.quantity,
//                   notification:
//                       (productState.quantity > 5) ? "Diskon 100%" : null,
//                   onIncTap: () {
//                     productState.quantity++;
//                   },
//                   onDecTap: () {
//                     productState.quantity--;
//                   },
//                   onAddCartTap: () {},
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProductState with ChangeNotifier {
//   int _quantity = 0;
//   int get quantity => _quantity;
//   set quantity(int newValue) {
//     _quantity = newValue;
//     notifyListeners();
//   }
// }
//FLUTTER 48. Custom Progress Bar (Timer + Provider)
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("Custom Progress Bar"),
//           ),
//           body: Center(
//             child: ChangeNotifierProvider<TimeState>(
//               create: (context) => TimeState(),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Consumer<TimeState>(
//                     builder: (context, timeState, _) => CustomProgressBar(
//                       width: 200,
//                       value: timeState.time,
//                       totalValue: 15,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Consumer<TimeState>(
//                     builder: (context, timeState, _) => RaisedButton(
//                       onPressed: () {
//                         Timer.periodic(Duration(seconds: 1), (timer) {
//                           if (timeState.time == 0)
//                             timer.cancel();
//                           else
//                             timeState.time -= 1;
//                         });
//                       },
//                       child: Text(
//                         "start",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       color: Colors.lightBlue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }

// class CustomProgressBar extends StatelessWidget {
//   final double width;
//   final int value;
//   final int totalValue;
//   CustomProgressBar({this.width, this.value, this.totalValue});

//   @override
//   Widget build(BuildContext context) {
//     double ratio = value / totalValue;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.timer,
//           color: Colors.grey[700],
//         ),
//         SizedBox(width: 5),
//         Stack(
//           children: [
//             Container(
//               width: width,
//               height: 10,
//               decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(5)),
//             ),
//             Material(
//               borderRadius: BorderRadius.circular(5),
//               child: AnimatedContainer(
//                 height: 10,
//                 width: width * ratio,
//                 duration: Duration(milliseconds: 500),
//                 decoration: BoxDecoration(
//                     color: (ratio < 0.3)
//                         ? Colors.red
//                         : (ratio < 0.6)
//                             ? Colors.yellow
//                             : Colors.lightGreen,
//                     borderRadius: BorderRadius.circular(5)),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

// class TimeState with ChangeNotifier {
//   int _time = 15;
//   int get time => _time;
//   set time(int newTime) {
//     _time = newTime;
//     notifyListeners();
//   }
// }

//FLUTTER 47. Timer
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isStop = true;
//   int counter = 0;
//   bool isBlack = true;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Tutorial Timer"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 counter.toString(),
//                 style: TextStyle(
//                     color: (isBlack) ? Colors.black : Colors.red,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold),
//               ),
//               RaisedButton(
//                 child: Text("5 detik kemudian"),
//                 onPressed: () {
//                   Timer(Duration(seconds: 3), () {
//                     setState(() {
//                       isBlack = !isBlack;
//                     });
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               RaisedButton(
//                 child: Text("Ubah warna secara langsung"),
//                 onPressed: () {
//                   Timer.run(() {
//                     setState(() {
//                       isBlack = !isBlack;
//                     });
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               RaisedButton(
//                 child: Text("Start Timer"),
//                 onPressed: () {
//                   counter = 0;
//                   isStop = false;
//                   Timer.periodic(Duration(seconds: 1), (timer) {
//                     if (isStop) timer.cancel();
//                     setState(() {
//                       counter++;
//                     });
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               RaisedButton(
//                 child: Text("Stop Timer"),
//                 onPressed: () {
//                   isStop = true;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//FLUTTER 46. Doc Comment

//FLUTTER 45. BLoC State Management (flutter_bloc Package) menggunakan package dari luar

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider<ColorBloc>(
//         builder: (context) => ColorBloc(),
//         child: MainPage(),
//       ),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
//     return Scaffold(
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             backgroundColor: Colors.amber,
//             onPressed: () {
//               bloc.dispatch(ColorEvent.to_amber);
//             },
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.lightBlue,
//             onPressed: () {
//               bloc.dispatch(ColorEvent.to_light_blue);
//             },
//           )
//         ],
//       ),
//       appBar: AppBar(
//         title: Text("Bloc dengan Flutter_bloc"),
//       ),
//       body: Center(
//         child: BlocBuilder<ColorBloc, Color>(
//           builder: (context, currentColor) => AnimatedContainer(
//             width: 100,
//             height: 100,
//             color: currentColor,
//             duration: Duration(
//               milliseconds: 500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// latihan FLUTTER 44. BLoC State Management (Stream Controller & Stream Builder)
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ColorBloc bloc = ColorBloc();
//   @override
//   void dispose() {
//     bloc.dispose;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FloatingActionButton(
//               backgroundColor: Colors.amber,
//               onPressed: () {
//                 bloc.eventSink.add(ColorEvent.to_amber);
//               },
//             ),
//             FloatingActionButton(
//               backgroundColor: Colors.lightBlue,
//               onPressed: () {
//                 bloc.eventSink.add(ColorEvent.to_light_blue);
//               },
//             ),
//             SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//         appBar: AppBar(
//           title: Text("Bloc tanpa library"),
//         ),
//         body: Center(
//           child: StreamBuilder(
//             stream: bloc.stateStream,
//             initialData: Colors.amber,
//             builder: (context, snapshot) {
//               return AnimatedContainer(
//                   //     color: Colors.amber,
//                   width: 100,
//                   height: 100,
//                   color: snapshot.data,
//                   duration: Duration(milliseconds: 500));
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan menggunakan multi provider state management
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider<Money>(
//             builder: (context) => Money(),
//           ),
//           ChangeNotifierProvider<Cart>(
//             builder: (context) => Cart(),
//           ),
//         ],
//         child: Scaffold(
//           floatingActionButton: Consumer<Money>(
//             builder: (context, money, _) => Consumer<Cart>(
//               builder: (context, cart, _) => FloatingActionButton(
//                 onPressed: () {
//                   if (money.balance >= 500) {
//                     cart.quantity += 1;
//                     money.balance -= 500;
//                   }
//                 },
//                 child: Icon(Icons.add_shopping_cart),
//                 backgroundColor: Colors.pink,
//               ),
//             ),
//           ),
//           appBar: AppBar(
//             backgroundColor: Colors.pink,
//             title: Text("Multi Provider"),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("Balance"),
//                     Container(
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Consumer<Money>(
//                           builder: (context, money, _) => Text(
//                             money.balance.toString(),
//                             style: TextStyle(
//                                 color: Colors.pink,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ),
//                       height: 30,
//                       width: 150,
//                       margin: EdgeInsets.all(5),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.pink[100],
//                         border: Border.all(color: Colors.pink, width: 2),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Consumer<Cart>(
//                       builder: (context, cart, _) => Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Apple (500) x " + cart.quantity.toString(),
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           Text(
//                             (500 * cart.quantity).toString(),
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   height: 30,
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     // color: Colors.pink[100],
//                     border: Border.all(color: Colors.black, width: 2),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan menggunakan provider state management
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider<ApplicationColor>(
//         builder: (context) => ApplicationColor(),
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             title: Consumer<ApplicationColor>(
//               builder: (context, applicationColor, _) => Text(
//                 "Provider State Management",
//                 style: TextStyle(color: applicationColor.color),
//               ),
//             ),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Consumer<ApplicationColor>(
//                   builder: (context, applicationColor, _) => AnimatedContainer(
//                     width: 100,
//                     height: 100,
//                     color: applicationColor.color,
//                     duration: Duration(milliseconds: 500),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("AB"),
//                     Consumer<ApplicationColor>(
//                       builder: (context, applicationColor, _) => Switch(
//                         value: applicationColor.islightBlue,
//                         onChanged: (newValue) {
//                           applicationColor.isLightBlue = newValue;
//                         },
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       child: Text("LB"),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//shared preference
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TextEditingController controller = TextEditingController(text: "No Name");
//   bool isON = false;

//   void saveData() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setString("nama", controller.text);
//     pref.setBool("ison", isON);
//   }

//   Future<String> getNama() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString("nama") ?? "No Name";
//   }

//   Future<bool> getON() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getBool("ison") ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Contoh Shared Preference "),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextField(
//                 controller: controller,
//               ),
//               Switch(
//                 value: isON,
//                 onChanged: (newValue) {
//                   setState(() {
//                     isON = newValue;
//                   });
//                 },
//               ),
//               RaisedButton(
//                   child: Text("Save"),
//                   onPressed: () {
//                     saveData();
//                   }),
//               RaisedButton(
//                 child: Text("Load"),
//                 onPressed: () {
//                   getNama().then((s) {
//                     controller.text = s;
//                     setState(() {});
//                     getON().then((b) {
//                       isON = b;
//                       setState(() {});
//                     });
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Animasi Padding
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   double myPaddinng = 5;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Padding Animasi cuy "),
//         ),
//         body: Column(
//           children: <Widget>[
//             Flexible(
//               flex: 1,
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPaddinng),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             myPaddinng = 20;
//                           });
//                         },
//                         child: Container(
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                     flex: 1,
//                   ),
//                   Flexible(
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPaddinng),
//                       child: Container(
//                         color: Colors.green,
//                       ),
//                     ),
//                     flex: 1,
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPaddinng),
//                       child: Container(
//                         color: Colors.blue,
//                       ),
//                     ),
//                     flex: 1,
//                   ),
//                   Flexible(
//                     child: AnimatedPadding(
//                       duration: Duration(seconds: 1),
//                       padding: EdgeInsets.all(myPaddinng),
//                       child: Container(
//                         color: Colors.yellow,
//                       ),
//                     ),
//                     flex: 1,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//latihan membuat switch dan animated switch
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isON = false;
//   Widget myWidget = Container(
//     width: 200,
//     height: 100,
//     decoration: BoxDecoration(
//       color: Colors.red,
//       border: Border.all(
//         color: Colors.black,
//         width: 3,
//       ),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Nyoba Buat Animated Switcher"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               AnimatedSwitcher(
//                 child: myWidget,
//                 duration: Duration(seconds: 1),
//                 transitionBuilder: (child, animation) => RotationTransition(
//                   turns: animation,
//                   child: child,
//                 ),
//               ),
//               Switch(
//                 inactiveTrackColor: Colors.red,
//                 inactiveThumbColor: Colors.red[200],
//                 activeColor: Colors.green,
//                 value: isON,
//                 onChanged: (newValue) {
//                   isON = newValue;
//                   setState(() {
//                     if (isON)
//                       myWidget = Container(
//                         key: ValueKey(1),
//                         width: 200,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 3,
//                           ),
//                         ),
//                       );
//                     // myWidget = SizedBox(
//                     //   width: 200,
//                     //   height: 100,
//                     //   child: Center(
//                     //     child: Text(
//                     //       "Switch: ON",
//                     //       style: TextStyle(
//                     //           color: Colors.green,
//                     //           fontWeight: FontWeight.w700,
//                     //           fontSize: 20),
//                     //     ),
//                     //   ),
//                     // );
//                     else
//                       myWidget = Container(
//                         key: ValueKey(2),
//                         width: 200,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 3,
//                           ),
//                         ),
//                       );
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Latihan pake Rest API get list
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String output = "no data";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Ngambil Data Cuy!!"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text(output),
//               RaisedButton(
//                 onPressed: () {
//                   User.getUsers("1").then((users) {
//                     output = "";
//                     for (int i = 0; i < users.length; i++)
//                       output = output + "[ " + users[i].name + " ] ";
//                     setState(() {});
//                   });
//                 },
//                 child: Text("GET"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//tutorial pake syncfusion flutter
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Nyoba Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     main() {
//       var rng = new Random();
//       for (var i = 0; i < 10; i++) {
//         double nilai;
//         nilai = rng.nextInt(100).toDouble();
//         return (nilai);
//       }
//     }

//     double nilai = main();
//     double kwh = 800 / 100 * nilai;
//     return Scaffold(
//       body: Center(
//           child: SfRadialGauge(
//         axes: <RadialAxis>[
//           RadialAxis(
//             startAngle: 180,
//             endAngle: 360,
//             axisLineStyle: AxisLineStyle(thickness: 10),
//             showTicks: false,
//             showLabels: false,
//             pointers: <GaugePointer>[
//               // NeedlePointer(
//               //   value: nilai,
//               //   enableAnimation: true,
//               //   needleStartWidth: 5,
//               //   needleEndWidth: 5,
//               //   needleColor: Colors.amber,
//               //   knobStyle: KnobStyle(
//               //       color: Colors.white,
//               //       borderColor: Color(0xFFDADADA),
//               //       knobRadius: 0.06,
//               //       borderWidth: 0.04),
//               //   tailStyle:
//               //       TailStyle(color: Colors.amber, width: 5, length: 0.15),
//               // ),
//               RangePointer(
//                   value: nilai,
//                   width: 10,
//                   enableAnimation: true,
//                   color: Colors.green),
//             ],
//             annotations: <GaugeAnnotation>[
//               GaugeAnnotation(
//                 widget: Column(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(top: 250, left: 30),
//                       width: 50.00,
//                       height: 50.00,
//                       // child: Icon(Icons.favorite),
//                       decoration: new BoxDecoration(
//                         image: new DecorationImage(
//                           image: ExactAssetImage('images/sun.png'),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 150, top: 10),
//                           child: Text(
//                             kwh.toString(),
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 0, top: 10),
//                           child: Text(
//                             " kWh",
//                             style: TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 165, top: 10),
//                           child: Text(
//                             "47% load",
//                             style: TextStyle(
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }

// latihan pake paket kdgaugeview
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Nyoba Speedometer'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   //child: Text("tes"),
//                   width: 400,
//                   height: 400,
//                   padding: EdgeInsets.all(10),
//                   child: KdGaugeView(
//                     minSpeed: 0,
//                     maxSpeed: 360,

//                     speed: 120,
//                     speedTextStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     animate: true,
//                     // alertSpeedArray: [40, 80, 100],
//                     // alertColorArray: [Colors.black, Colors.black, Colors.black],
//                     duration: Duration(seconds: 2),
//                     //subDivisionCircleColors: Colors.pink,
//                     divisionCircleColors: Colors.transparent,
//                     fractionDigits: 0,
//                     baseGaugeColor: Colors.transparent,

//                     subDivisionCircleColors: Colors.transparent,

//                     activeGaugeColor: Colors.green,
//                     inactiveGaugeColor: Colors.amber,
//                     innerCirclePadding: 32.0,

//                     minMaxTextStyle: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.amber,
//                     ),
//                     unitOfMeasurement: "",
//                     unitOfMeasurementTextStyle: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             //margin: EdgeInsets.all(150),
//             color: Colors.pink,
//             constraints: BoxConstraints(
//                 maxHeight: 100.0,
//                 maxWidth: 100.0,
//                 minWidth: 100.0,
//                 minHeight: 100.0),
//             //alignment: Alignment(0.9, 0.25),
//             //child: Text("data"),
//           )
//         ],
//       ),
//     );
//   }
// }

//tutorial method GET dan POST
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
// //  PostResult postResult = null;
//   User user = null;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Noba API"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text((user != null)
//                   ? user.id + " | " + user.name
//                   : "Tidak ada data"),
//               RaisedButton(
//                 onPressed: () {
//                   User.connectTOAPI("3").then((value) {
//                     user = value;
//                     setState(() {});
//                   });
//                 },
//                 child: Text("GET"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//latihan barcode
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   String text = 'hasil QR Scan';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Scan"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(text),
//             SizedBox(
//               height: 20,
//             ),
//             RaisedButton(
//               child: Text("Scan"),
//               onPressed: () async {
//                 text = await scanner.scan();
//                 setState(() {});
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//latihan main musik
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   AudioPlayer audioPlayer;
//   String durasi = "00:00:00";
//   _MyAppState() {
//     audioPlayer = AudioPlayer();
//     audioPlayer.onAudioPositionChanged.listen((duration) {
//       setState(() {
//         durasi = duration.toString();
//       });
//     });
//     audioPlayer.setReleaseMode(ReleaseMode.LOOP);
//   }
//   void playSound(String url) async {
//     await audioPlayer.seek(Duration(seconds: 30));
//     await audioPlayer.play(url);
//   }

//   void pauseSound() async {
//     await audioPlayer.pause();
//   }

//   void stopSound() async {
//     await audioPlayer.stop();
//   }

//   void resumeSound() async {
//     audioPlayer.resume();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Playing Music"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: () {
//                   playSound(
//                       "https://www.bensound.com/bensound-music/bensound-ukulele.mp3");
//                 },
//                 child: Text("Play"),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   pauseSound();
//                 },
//                 child: Text("Pause"),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   stopSound();
//                 },
//                 child: Text("Stop"),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   resumeSound();
//                 },
//                 child: Text("Resume"),
//               ),
//               Text(
//                 durasi,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan gradient opacity
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Gradient Opacity"),
//         ),
//         body: Center(
//           child: ShaderMask(
//             shaderCallback: (rectangle) {
//               return LinearGradient(
//                       colors: [Colors.black, Colors.transparent],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter)
//                   .createShader(
//                       Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
//             },
//             blendMode: BlendMode.dstIn,
//             child: Image(
//               width: 300,
//               image: NetworkImage(
//                   "https://pix10.agoda.net/hotelImages/361/3612581/3612581_18010316150060733791.jpg?s=1024x768"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//colorful button
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Colorful Buttons"),
//         ),
//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ColorfulButton(Colors.pink, Colors.blue, Icons.adb),
//               ColorfulButton(Colors.amber, Colors.red, Icons.comment),
//               ColorfulButton(Colors.green, Colors.purple, Icons.computer),
//               ColorfulButton(Colors.blue, Colors.yellow, Icons.contact_phone),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan QR code
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: QrImage(
//             version: 6,
//             backgroundColor: Colors.grey,
//             foregroundColor: Colors.black,
//             errorCorrectionLevel: QrErrorCorrectLevel.M,
//             padding: EdgeInsets.all(30),
//             size: 300,
//             data: "wintrik.com",
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan custom appbar height
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(200),
//           child: AppBar(
//             backgroundColor: Colors.amber,
//             flexibleSpace: Align(
//               alignment: Alignment.bottomRight,
//               child: Container(
//                 margin: EdgeInsets.all(20),
//                 child: Text(
//                   "AppBar with Custom Height",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//             //title: Text("AppBar with Custom Height"),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Latihan Tab Bar
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TabBar myTabBar = TabBar(
//       //indicatorColor: Colors.red,
//       indicator: BoxDecoration(
//         color: Colors.red,
//         border: Border(
//           top: BorderSide(
//             color: Colors.purple,
//           ),
//         ),
//       ),
//       tabs: <Widget>[
//         Tab(
//           icon: Icon(Icons.comment),
//           child: Text(
//             "Comments",
//             style: TextStyle(fontSize: 11),
//           ),
//         ),
//         Tab(
//           child: Icon(Icons.computer),
//         ),
//       ],
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Contoh Tab Bar"),
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
//               child: Container(
//                 color: Colors.amber,
//                 child: myTabBar,
//               ),
//             ),
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               Center(
//                 child: Text("Tab 1"),
//               ),
//               Center(
//                 child: Text("Tab 2"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan hero & ClipRRect Widget
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue[50],
//       //appBar: AppBar(
//       // backgroundColor: Colors.black,
//       // title: Text(
//       //   "Latihan Hero Animation",
//       //   style: TextStyle(
//       //     color: Colors.white,
//       //   ),
//       // ),
//       //  ),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return SecondPage();
//               },
//             ),
//           );
//         },
//         child: Hero(
//           tag: 'profile',
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: Container(
//               width: 100,
//               height: 100,
//               child: Image(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                       "https://awsimages.detik.net.id/visual/2020/01/06/e65a3d76-98fa-4c35-a082-b0480c00637c_43.jpeg?w=450&q=90")),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[50],
//       appBar: AppBar(
//         backgroundColor: Colors.pink[50],
//         // title: Text(
//         //   "Latihan Hero Animation",
//         //   style: TextStyle(
//         //     color: Colors.white,
//         //   ),
//         // ),
//       ),
//       body: Center(
//         child: Hero(
//           tag: 'profile',
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(100),
//             child: Container(
//               width: 200,
//               height: 200,
//               child: Image(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                       "https://awsimages.detik.net.id/visual/2020/01/06/e65a3d76-98fa-4c35-a082-b0480c00637c_43.jpeg?w=450&q=90")),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //FLUTTER 24. Positioned, FloatingActionButton, LoginPage
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   double getSmallDiameter(BuildContext context) =>
//       MediaQuery.of(context).size.width * 2 / 3;
//   double getBigDiameter(BuildContext context) =>
//       MediaQuery.of(context).size.width * 7 / 8;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffeeeeee),
//       body: Stack(
//         children: <Widget>[
//           Positioned(
//             right: -getSmallDiameter(context) / 3,
//             top: -getSmallDiameter(context) / 3,
//             child: Container(
//               width: getSmallDiameter(context),
//               height: getSmallDiameter(context),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(colors: [
//                   Color(0xffb226b2),
//                   Color(0xffff6da7),
//                 ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//               ),
//             ),
//           ),
//           Positioned(
//             left: -getBigDiameter(context) / 4,
//             top: -getBigDiameter(context) / 4,
//             child: Container(
//               child: Center(
//                 child: Text(
//                   "dribble",
//                   style: TextStyle(
//                     fontFamily: "stocky",
//                     //fontStyle: FontStyle.italic,
//                     fontSize: 30,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               width: getBigDiameter(context),
//               height: getBigDiameter(context),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(colors: [
//                   Color(0xffb226b2),
//                   Color(0xffff4891),
//                 ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//               ),
//             ),
//           ),
//           Positioned(
//             right: -getBigDiameter(context) / 2,
//             bottom: -getBigDiameter(context) / 2,
//             child: Container(
//               width: getBigDiameter(context),
//               height: getBigDiameter(context),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFF3E9EE),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.grey,
//                     ),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
//                   child: Column(
//                     children: <Widget>[
//                       TextField(
//                         decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.email,
//                             color: Color(0xffff4891),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xffff4891),
//                             ),
//                           ),
//                           labelText: "Email: ",
//                           labelStyle: TextStyle(color: Color(0xffff4891)),
//                         ),
//                       ),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.vpn_key,
//                             color: Color(0xffff4891),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xffff4891),
//                             ),
//                           ),
//                           labelText: "Password: ",
//                           labelStyle: TextStyle(color: Color(0xffff4891)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
//                     child: Text(
//                       "FORGOT PASSWORD?",
//                       style: TextStyle(
//                         color: Color(0xffff4891),
//                         fontSize: 11,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.5,
//                         height: 40,
//                         child: Container(
//                           child: Material(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(20),
//                               splashColor: Colors.amber,
//                               onTap: () {},
//                               child: Center(
//                                 child: Text(
//                                   "SIGN IN",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             gradient: LinearGradient(
//                                 colors: [
//                                   Color(0xffb226b2),
//                                   Color(0xffff4891),
//                                 ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter),
//                           ),
//                         ),
//                       ),
//                       FloatingActionButton(
//                         onPressed: () {},
//                         mini: true,
//                         elevation: 2,
//                         child: Image(
//                           image: NetworkImage(
//                             "https://1.bp.blogspot.com/-S8HTBQqmfcs/XN0ACIRD9PI/AAAAAAAAAlo/FLhccuLdMfIFLhocRjWqsr9cVGdTN_8sgCPcBGAYYCw/s1600/f_logo_RGB-Blue_1024.png",
//                           ),
//                           alignment: Alignment.topCenter,
//                         ),
//                       ),
//                       FloatingActionButton(
//                         onPressed: () {},
//                         mini: true,
//                         elevation: 2,
//                         child: Image(
//                             image: NetworkImage(
//                                 "https://cdn4.iconfinder.com/data/icons/social-media-icons-the-circle-set/48/twitter_circle-512.png")),
//                       )
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "DON'T HAVE AN ACCOUNT?   ",
//                       style: TextStyle(
//                         fontSize: 11,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       "SIGN UP",
//                       style: TextStyle(
//                         fontSize: 11,
//                         color: Color(0xffff4891),
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//latihan buat Custom Card
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Custom Card Example",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Color(0xff8c062f),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xffff5788), Color(0xfff56d5d)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           Center(
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width * 0.8,
//               height: MediaQuery.of(context).size.height * 0.7,
//               child: Card(
//                 elevation: 10,
//                 child: Stack(
//                   children: <Widget>[
//                     Opacity(
//                       opacity: 0.2,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           image: DecorationImage(
//                               image: AssetImage("images/black-mamba.png"),
//                               fit: BoxFit.cover),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(4),
//                           topRight: Radius.circular(4),
//                         ),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                               "https://awsimages.detik.net.id/visual/2020/01/06/e65a3d76-98fa-4c35-a082-b0480c00637c_43.jpeg?w=450&q=90"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(
//                           20,
//                           50 + MediaQuery.of(context).size.height * 0.35,
//                           20,
//                           20),
//                       child: Center(
//                         child: Column(
//                           children: <Widget>[
//                             Text(
//                               "Curriculum Vitae of Lisa Blackpink",
//                               maxLines: 2,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Color(0xFFF56D5D),
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     "Born on ",
//                                     maxLines: 2,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                   Text(
//                                     " March 27, 1997",
//                                     maxLines: 2,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Color(0xFFF56D5D),
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 Spacer(
//                                   flex: 10,
//                                 ),
//                                 //icon
//                                 Icon(
//                                   Icons.thumb_up,
//                                   size: 18,
//                                   color: Colors.grey,
//                                 ),
//                                 Spacer(
//                                   flex: 1,
//                                 ),
//                                 //text
//                                 Text(
//                                   "999",
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 Spacer(
//                                   flex: 5,
//                                 ),
//                                 //icon
//                                 Icon(
//                                   Icons.comment,
//                                   size: 18,
//                                   color: Colors.grey,
//                                 ),
//                                 Spacer(
//                                   flex: 1,
//                                 ),
//                                 //text
//                                 Text(
//                                   "999",
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 Spacer(
//                                   flex: 10,
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//Latihan buat button
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Membuat Button"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               RaisedButton(
//                 color: Colors.amber,
//                 child: Text("Raised Button"),
//                 shape: StadiumBorder(),
//                 onPressed: () {},
//               ),
//               Material(
//                 elevation: 2,
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   width: 150,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       gradient: LinearGradient(
//                         colors: [Colors.purple, Colors.pink],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       )),
//                   child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       splashColor: Colors.amber,
//                       onTap: () {},
//                       child: Center(
//                           child: Text(
//                         "My Button",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Latihan Media Query
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Media Query"),
//         ),
//         body: (MediaQuery.of(context).orientation == Orientation.portrait)
//             ? Column(
//                 children: generateContainers(),
//               )
//             : Row(children: generateContainers())
//         // body: Container(
//         //   color: Colors.red,
//         //   width: MediaQuery.of(context).size.width / 3,
//         //   height: MediaQuery.of(context).size.height / 2,
//         // ),
//         );
//   }

//   List<Widget> generateContainers() {
//     return <Widget>[
//       Container(
//         color: Colors.red,
//         width: 100,
//         height: 100,
//       ),
//       Container(
//         color: Colors.green,
//         width: 100,
//         height: 100,
//       ),
//       Container(
//         color: Colors.blue,
//         width: 100,
//         height: 100,
//       ),
//     ];
//   }
// }

//Latihan TextField
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Text Field"),
//         ),
//         body: Container(
//           margin: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               TextField(
//                 decoration: InputDecoration(
//                     icon: Icon(Icons.adb),
//                     prefixIcon: Icon(Icons.person),
//                     // prefix: Container(
//                     //   width: 5,
//                     //   height: 5,
//                     //   color: Colors.red,
//                     // ),
//                     fillColor: Colors.lightBlue[50],
//                     filled: true,
//                     suffixText: "Name",
//                     suffixStyle: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     labelText: "Nama Lengkap",
//                     hintText: "Nama lengkapmu aja...",
//                     hintStyle: TextStyle(fontSize: 12),
//                     labelStyle: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//                 maxLength: 5,
//                 // obscureText: false, //untuk password
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//                 controller: controller,
//               ),
//               Text(
//                 controller.text,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Latihan buat card
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.green,
//         body: Container(
//           margin: EdgeInsets.all(10),
//           child: ListView(
//             children: <Widget>[
//               buildCard(Icons.account_box, "Account Box"),
//               buildCard(Icons.adb, "Serangga Android"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Card buildCard(IconData iconData, String text) {
//     return Card(
//       elevation: 5,
//       child: Row(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.all(5),
//             child: Icon(
//               iconData,
//               color: Colors.amber,
//             ),
//           ),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }

//card sebelumnya
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.green,
//         body: Container(
//           margin: EdgeInsets.all(10),
//           child: ListView(
//             children: <Widget>[
//               Card(
//                 elevation: 5,
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       child: Icon(Icons.account_box),
//                     ),
//                     Text("Account Box"),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Latihan AppBar
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: Icon(
//             Icons.adb,
//             color: Colors.white,
//           ),
//           title: Text(
//             "AppBar Example",
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.exit_to_app),
//               onPressed: () {},
//             ),
//           ],
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xff0096ff),
//                   Color(0xff6610f2),
//                 ],
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight,
//               ),
//               image: DecorationImage(
//                 image: AssetImage("images/black-mamba.png"),
//                 fit: BoxFit.none,
//                 repeat: ImageRepeat.repeat,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// latihan draggable
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Color color1 = Colors.red;
//   Color color2 = Colors.amber;
//   Color targetColor;
//   bool isAccepted = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Dragable"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Draggable<Color>(
//                   data: color1,
//                   child: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Material(
//                       color: color1,
//                       shape: StadiumBorder(),
//                       elevation: 0,
//                     ),
//                   ),
//                   childWhenDragging: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Material(
//                       color: Colors.grey,
//                       shape: StadiumBorder(),
//                       elevation: 5,
//                     ),
//                   ),
//                   feedback: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Material(
//                       color: color1.withOpacity(0.7),
//                       shape: StadiumBorder(),
//                       elevation: 5,
//                     ),
//                   ),
//                 ),
//                 Draggable<Color>(
//                   data: color2,
//                   child: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Material(
//                       color: color2,
//                       shape: StadiumBorder(),
//                       elevation: 0,
//                     ),
//                   ),
//                   childWhenDragging: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Material(
//                       color: Colors.grey,
//                       shape: StadiumBorder(),
//                       elevation: 5,
//                     ),
//                   ),
//                   feedback: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Material(
//                       color: color2.withOpacity(0.7),
//                       shape: StadiumBorder(),
//                       elevation: 5,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             DragTarget<Color>(
//               onWillAccept: (value) => true,
//               onAccept: (value) {
//                 isAccepted = true;
//                 targetColor = value;
//               },
//               builder: (context, candidates, rejected) {
//                 return (isAccepted)
//                     ? SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Material(
//                           color: targetColor,
//                           shape: StadiumBorder(),
//                           elevation: 5,
//                         ),
//                       )
//                     : SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Material(
//                           color: Colors.black26,
//                           shape: StadiumBorder(),
//                           elevation: 5,
//                         ),
//                       );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//belajar Spacer
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Spacer Widget"),
//         ),
//         body: Center(
//           child: Row(
//             children: <Widget>[
//               // Spacer(
//               //   flex: 1,
//               // ),
//               Container(
//                 width: 80,
//                 height: 80,
//                 color: Colors.red,
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Container(
//                 width: 80,
//                 height: 80,
//                 color: Colors.green,
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Container(
//                 width: 80,
//                 height: 80,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//latihan image widget
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Image"),
//         ),
//         body: Center(
//           child: Container(
//             color: Colors.black,
//             width: 200,
//             height: 200,
//             padding: EdgeInsets.all(3),
//             child: Image(
//               image: AssetImage("images/Screenshot_111.png"),
//               fit: BoxFit.contain,
//               // repeat: ImageRepeat.repeat,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Latihan stack dan align
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Stack dan Align by L-A"),
//         ),
//         body: Stack(
//           children: <Widget>[
//             //background
//             Column(
//               children: <Widget>[
//                 Flexible(
//                   flex: 1,
//                   child: Row(
//                     children: <Widget>[
//                       Flexible(
//                         flex: 1,
//                         child: Container(
//                           color: Colors.white,
//                         ),
//                       ),
//                       Flexible(
//                         flex: 1,
//                         child: Container(
//                           color: Colors.black12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: Row(
//                     children: <Widget>[
//                       Flexible(
//                         flex: 1,
//                         child: Container(
//                           color: Colors.black12,
//                         ),
//                       ),
//                       Flexible(
//                         flex: 1,
//                         child: Container(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             //listview dengan text
//             ListView(
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontFamily: "CrashLandingBB",
//                           fontStyle: FontStyle.italic,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: Text(
//                         "Ini adalah text yang ada di lapisan tengah dari Stack",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             //button di tengah bawah
//             Align(
//               alignment: Alignment(0, 1),
//               child: RaisedButton(
//                 child: Text("My Button"),
//                 color: Colors.amber,
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Latihan Flexible Widget
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Flexible Layout"),
//         ),
//         body: Column(
//           children: <Widget>[
//             Flexible(
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       color: Colors.green,
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       color: Colors.red,
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 2,
//               child: Container(
//                 margin: EdgeInsets.all(5),
//                 color: Colors.amber,
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: Container(
//                 margin: EdgeInsets.all(5),
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Latihan animated container
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Random random = Random();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Animated Container by L-A"),
//         ),
//         body: Center(
//           child: GestureDetector(
//             onTap: () {
//               setState(() {});
//             },
//             child: AnimatedContainer(
//               color: Color.fromARGB(255, random.nextInt(256),
//                   random.nextInt(256), random.nextInt(256)),
//               duration: Duration(seconds: 1),
//               width: 50.0 + random.nextInt(101),
//               height: 50.0 + random.nextInt(101),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //latihan list view
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Widget> widgets = [];
//   int counter = 1;

//   // _MyAppState() {
//   //   for (int i = 0; i < 15; i++)
//   //     widgets.add(Text(
//   //       "Data ke-" + i.toString(),
//   //       style: TextStyle(fontSize: 40),
//   //     ));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan ListView by L-A"),
//         ),
//         body: ListView(children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               RaisedButton(
//                   child: Text("Tambah Data"),
//                   onPressed: () {
//                     setState(() {
//                       widgets.add(Text(
//                         "Data ke-" + counter.toString(),
//                         style: TextStyle(fontSize: 35),
//                       ));
//                       counter++;
//                     });
//                   }),
//               RaisedButton(
//                   child: Text("Hapus Data"),
//                   onPressed: () {
//                     setState(() {
//                       widgets.removeLast();
//                       counter--;
//                     });
//                   }),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: widgets,
//           )
//         ]),
//       ),
//     );
//   }
// }

//latihan text style
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Text Style by L-A"),
//         ),
//         body: Center(
//           child: Text(
//             "Ini adalah Text",
//             style: TextStyle(
//               fontFamily: "CrashLandingBB",
//               fontStyle: FontStyle.italic,
//               fontSize: 30,
//               decoration: TextDecoration.underline,
//               decorationColor: Colors.red,
//               decorationThickness: 5,
//               decorationStyle: TextDecorationStyle.wavy,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //belajar anonymous method
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String message = "ini adalah Text";
//   // void tombolDitekan() {
//   //   setState(() {
//   //     message = "Sudah ditekan";
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("Anonymous  Method by L-A"),
//           ),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(message),
//               RaisedButton(
//                 child: Text("tekan saya"),
//                 onPressed: () {
//                   setState(() {
//                     message = "Sudah ditekan";
//                   });
//                 },
//               )
//             ],
//           )),
//     );
//   }
// }

//belajar statefulwidget
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int number = 0;
//   void tekanTombol() {
//     setState(() {
//       number += 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan anu"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 number.toString(),
//                 style: TextStyle(fontSize: 10 + number.toDouble()),
//               ),
//               RaisedButton(
//                 child: Text("Tambah bilangan"),
//                 onPressed: tekanTombol,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//Cara pake Stateful
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int number = 0;

//   void tekanTombol() {
//     setState(() {
//       number += 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Stateful Widget Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 number.toString(),
//                 style: TextStyle(fontSize: 10 + number.toDouble()),
//               ),
//               RaisedButton(
//                 child: Text("Tambah Bilangan"),
//                 onPressed: tekanTombol,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//cara pake stateless
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           //title: Text("Aplikasi Hello World"),
//           title: Text("Latihan Row dan Columm"),
//         ),

// //belajar container
//         body: Container(
//           color: Colors.indigoAccent,
//           margin: EdgeInsets.fromLTRB(10, 15, 20, 25),
//           // margin: EdgeInsets.all(10),
//           padding: EdgeInsets.only(bottom: 20, top: 20),
//           //padding: EdgeInsets.all(10),
//           child: Container(
//             margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: <Color>[
//                       Colors.amber,
//                       Colors.blue,
//                       Colors.black,
//                     ])),
//             //decoration: BoxDecoration(color: Colors.blue),
//             // color: Colors.amber,
//             // margin: EdgeInsets.all(10),
//           ),
//         ),

// // belajar column dan row
// //         body: Column(
// // //          mainAxisAlignment: MainAxisAlignment.center,
// //           //crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             // Text("Text 1"),
// //             // Text("Text 2"),
// //             // Text("text 3"),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 // Text("Text 4"),
// //                 Column(
// //                   children: <Widget>[
// //                     Text("Text 4"),
// //                     Text("Text 5"),
// //                     Text("Text 6")
// //                   ],
// //                 ),
// //                 Column(
// //                   children: <Widget>[
// //                     Text("Text 7"),
// //                     Text("Text 8"),
// //                     Text("Text 9")
// //                   ],
// //                 ),
// //                 Column(
// //                   children: <Widget>[
// //                     Text("Text 10"),
// //                     Text("Text 11"),
// //                     Text("Text 12")
// //                   ],
// //                 ),
// //                 // Text("Text 5"),
// //                 // Text("Text 6")
// //               ],
// //             ),
// //             // Text("text 3"),
// //           ],
// //         ),

// // belajar font dan style
//         // body: Center(
//         //     child: Container(
//         //         color: Colors.lightBlue,
//         //         width: 150,
//         //         //height: 50,
//         //         child: Text(
//         //           "Saya sedang melatih kemampuan flutter saya",
//         //           style: TextStyle(
//         //               color: Colors.white,
//         //               fontStyle: FontStyle.italic,
//         //               fontWeight: FontWeight.w700,
//         //               fontSize: 20),
//         //           //textAlign: TextAlign.center,
//         //           // maxLines: 2,
//         //           // overflow: TextOverflow.clip,
//         //           // softWrap: false,
//         //         ))),
//       ),
//     );
//   }
// }
