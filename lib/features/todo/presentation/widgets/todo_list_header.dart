import 'package:flutter/material.dart';
import 'package:shortpoint/core/presentation/theme/shared_styles.dart';

class TodosListHeader extends StatelessWidget {
  const TodosListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 123,
      color: const Color(0xff3556AB),
      child: Row(
        children: [
          Flexible(child: _UserAvatar()),
          Expanded(child: _Greeting())
        ],
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Hello, John",
            style: TextStyle(color: Colors.white, fontSize: 16, shadows: [
              SharedStyles.textShadow,
            ])),
        Expanded(
          child: Text(
            "What are your plans for today?",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 25,
                fontWeight: FontWeight.w100,
                color: Colors.white,
                shadows: [
                  SharedStyles.textShadow,
                ]),
          ),
        )
      ]),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage("assets/images/profile.png"),
    );
  }
}
