import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/shared_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff3556AB),
      title: Text(title, style: TextStyle(shadows: [SharedStyles.textShadow])),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(62);
}
