import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:drinkees/src/pages/main_screen.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MainScreen());
}
