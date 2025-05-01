

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
 final  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,style: TextStyle(fontSize: 30),),elevation: 0,backgroundColor: Color.fromARGB(255, 30, 121, 149),);
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
