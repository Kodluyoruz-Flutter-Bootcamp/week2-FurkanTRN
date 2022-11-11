import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_system/Models/Member.dart';
import 'package:library_system/Screens/MemberScreens/MemberDetailWidget.dart';
import 'MemberOperation_Widget.dart';

class MemberOperations_Page extends StatelessWidget {
  const MemberOperations_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MemberOperation_Widget();
  }
}
