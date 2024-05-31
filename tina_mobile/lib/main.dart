// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tina_mobile/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: Color(0xFF211522),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF211522),
          toolbarHeight: 100,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Color(0xFF2F1933),
          filled: true,
          alignLabelWithHint: false,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          errorStyle: TextStyle(color: Colors.white),
          floatingLabelStyle: TextStyle(color: Colors.white),
          suffixStyle: TextStyle(color: Colors.white),
          helperStyle: TextStyle(color: Colors.white),
          prefixStyle: TextStyle(color: Colors.white),
          counterStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          iconColor: Color(0xFFFFDC71),
        ),
        datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white),
        iconTheme: IconThemeData(
          color: Color(
            0xFFFFDC71,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Color(0xFFE195ED),
          thickness: 0.1,
          endIndent: 20,
          indent: 20,
          space: 60,
        ),
        useMaterial3: true,
        listTileTheme: ListTileThemeData(
          tileColor: Color(0xFF2F1933),
          textColor: Colors.white,
          selectedColor: Colors.white,
          leadingAndTrailingTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor:
              MaterialStateProperty.resolveWith((states) => Color(0xFFFFDC71)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
             backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFFFFDC71)),
             foregroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFF211522)),
             fixedSize: MaterialStateProperty.resolveWith((states) => Size(300, 40))
          )
        )
      ),
      home: const MyHomePage(),
    );
  }
}
