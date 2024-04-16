import 'package:flutter/material.dart';

class FormHelper {
  static Widget textInput(
    BuildContext context,
    Function onChanged,
    Widget hintText, {
    bool isTextArea = false,
    bool isNumberInput = false,
    bool isRequired = false,
    obscureText = false,
    bool readOnly = false,
  }) {
    return TextFormField(
      decoration: fieldDecoration(context, hintText, isRequired),
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: !isTextArea ? 1 : 3,
      keyboardType: isNumberInput ? TextInputType.number : TextInputType.text,
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }

  static InputDecoration fieldDecoration(
    BuildContext context,
    Widget labelWidget,
    bool isRequired,
  ) {
    return InputDecoration(
      label: labelWidget,
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 222, 222, 222),
          width: 1,
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 222, 222, 222),
          width: 1,
        ),
      ),
    );
  }

  // static Widget fieldLabelValue(BuildContext context, String labelName) {
  //   return FormHelper.textInput(
  //     context,
  //     labelName,
  //     (value) => {},
  //     // onValidate: (value) {
  //     //   return null;
  //     // },
  //     readOnly: true,
  //   );
  // }

  // static Widget saveButton(String buttonText, Function onTap,
  //     {String color, String textColor, bool fullWidth}) {
  //   return Container(
  //     height: 50.0,
  //     width: 150,
  //     child: GestureDetector(
  //       onTap: () {
  //         onTap();
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(
  //             color: Color.fromARGB(255, 71, 141, 247),
  //             style: BorderStyle.solid,
  //             width: 1.0,
  //           ),
  //           color: Color.fromARGB(255, 71, 141, 247),
  //           borderRadius: BorderRadius.circular(30.0),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Center(
  //               child: Text(
  //                 buttonText,
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                   letterSpacing: 1,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static void showMessage(
  //   BuildContext context,
  //   String title,
  //   String message,
  //   String buttonText,
  //   Function onPressed,
  // ) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: new Text(title),
  //         content: new Text(message),
  //         actions: [
  //           new FlatButton(
  //             onPressed: () {
  //               return onPressed();
  //             },
  //             child: new Text(buttonText),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  static isInputRequired(String label, {bool isRequired = true}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: label,
          style: const TextStyle(
              color: Color.fromARGB(255, 123, 123, 123), fontSize: 13)),
      isRequired
          ? const TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red),
            )
          : TextSpan(),
    ]));
  }
}
