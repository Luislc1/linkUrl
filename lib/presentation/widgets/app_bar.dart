import 'dart:io';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF053549),
      centerTitle: true,
      title: Text('LinkURL',style: TextStyle(color: Colors.white),),
      elevation: 1,
      actions: [
        IconButton(onPressed: () => exit(0), icon: Icon(Icons.exit_to_app, color: Colors.white,)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}