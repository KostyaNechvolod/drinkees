import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:drinkees/src/pages/home_page.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(HomePage());
}
