import 'package:flutter/material.dart';

class MyListtile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const MyListtile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
