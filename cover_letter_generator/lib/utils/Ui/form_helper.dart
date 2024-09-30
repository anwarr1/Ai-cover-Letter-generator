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
      decoration: fieldDecoration(context, hintText),
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
          : const TextSpan(),
    ]));
  }
}

class rowForm extends StatelessWidget {
  const rowForm({
    super.key,
    required this.width,
    required this.firstColumn,
    required this.SecondColumn,
  });

  final double width;
  final Widget firstColumn;
  final Widget SecondColumn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        firstColumn,
        SizedBox(
          width: width * 0.02,
        ),
        SecondColumn
      ],
    );
  }
}

class InputUI extends StatelessWidget {
  const InputUI({
    super.key,
    required this.width,
    required this.hint,
    required this.onChanged,
  });

  final double width;
  final Widget hint;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: TextFormField(
            decoration: FormHelper.fieldDecoration(context, hint),
            keyboardType: TextInputType.text,
            onChanged: onChanged));
  }
}
