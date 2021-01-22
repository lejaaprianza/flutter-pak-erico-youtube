// import 'package:flutter/material.dart';
// import 'package:division/division.dart';
// import 'package:hello_world/ui/styles/custom_styles.dart';

// class CustomButton extends StatefulWidget {
//   final ParentStyle buttonStyle;

//   CustomButton(this.buttonStyle);
//   @override
//   _CustomButtonState createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   bool isTapDown = false;
//   @override
//   Widget build(BuildContext context) {
//     return Parent(
//         child: Container(
//           child: Txt(
//             "division",
//             style: CustomStyles.txtStyle,
//           ),
//         ),
//         style: widget.buttonStyle.clone()
//           ..scale((isTapDown) ? 1.1 : 1)
//           ..elevation((isTapDown) ? 0 : 5),
//         gesture: Gestures()
//           ..onTapDown((details) {
//             setState(() {
//               isTapDown = true;
//             });
//           })
//           ..onTapUp((details) {
//             setState(() {
//               isTapDown = false;
//             });
//           })
//           ..onTapCancel(() {})
//         // ..onTapCancel((details) {})
//         // gesture: G(),
//         );
//   }
// }
