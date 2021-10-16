import 'package:flutter/material.dart';

class RabbidAppBar extends StatelessWidget with PreferredSizeWidget {
  const RabbidAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.home, color: Colors.pink.shade800, size: 40),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
