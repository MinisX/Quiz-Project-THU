// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class customWidgets {
  customWidgets({Key? key});

  /*
  The following widget is to create a custom Text field
  parameteres:
  TextEditingController _textEditingController: just a TextEditingController,
  String _label: Helper text inside the field,
  Size _size: size of the context(display screen), to be able to resize the field accordingly,
  TextInputType _textInputType: controls keyboared input type,
  bool obsecured: default parameter to set user input to obsecured or not obsecured (default: not obsecured)
  */
  Widget customTextField(TextEditingController _textEditingController,
      String _label, double _width, TextInputType _textInputType,
      {bool obsecured = false}) {
    return SizedBox(
      width: _width,
      child: TextField(
        obscureText: obsecured,
        keyboardType: _textInputType,
        controller: _textEditingController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.yellow)),
          contentPadding: const EdgeInsets.all(15),
          labelText: _label,
          labelStyle: const TextStyle(
            fontFamily: 'Lobster',
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  //*this is A button with the label 'register on it'
  Widget customButton(String _label, Color _backgroundcolor, void _function) {
    return FloatingActionButton.extended(
      onPressed: () {
        _function;
      },
      label: Text(
        _label,
        style: const TextStyle(
          fontSize: 30,
          fontFamily: 'Lobster',
        ),
      ),
      backgroundColor: _backgroundcolor,
      extendedPadding: const EdgeInsets.all(40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }

  //*this Widet is to print Text on the Page
  Widget customText(String text,
      {String fontFam = 'Lobster',
      double fontsize = 50,
      Color forgroundColor = Colors.white,
      Color? backgroundColor = Colors.teal,
      FontWeight fontweight = FontWeight.bold,
      TextAlign textalign = TextAlign.center}) {
    return Stack(children: [
      Text(
        text,
        textAlign: textalign,
        style: TextStyle(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = forgroundColor,
          fontWeight: fontweight,
          fontFamily: fontFam,
          fontSize: fontsize,
        ),
      ),
      Text(
        text,
        textAlign: textalign,
        style: TextStyle(
          fontWeight: fontweight,
          fontFamily: fontFam,
          fontSize: fontsize,
          color: backgroundColor,
        ),
      )
    ]);
  }
}