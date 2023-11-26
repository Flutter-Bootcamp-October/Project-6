import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.actionIcon,
  });
  final IconData leadingIcon;
  final String title;
  final actionIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          leadingIcon,
        ),
      ),
      title: Text(title),
      centerTitle: true,
      actions: [Icon(actionIcon), const SizedBox(width: 8)],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
