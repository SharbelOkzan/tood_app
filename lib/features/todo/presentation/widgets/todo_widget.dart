import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  final String name;
  final bool isChecked;
  final void Function() onEditPressed;
  final void Function() onCheckboxChanged;

  const TodoWidget(
      {super.key,
      required this.name,
      required this.isChecked,
      required this.onEditPressed,
      required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 27, bottom: 32, left: 23, right: 19),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: List<BoxShadow>.generate(
          1,
          (int index) => BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CircularCheckbox(value: isChecked, onChanged: onCheckboxChanged),
          _Title(name: name),
          _EditButton(
            onPressed: onEditPressed,
          )
        ],
      ),
    );
  }
}

class _EditButton extends StatelessWidget {
  final Function onPressed;

  const _EditButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Color(0xff071D55)),
        side: MaterialStatePropertyAll(BorderSide(color: Color(0xff071D55))),
        fixedSize: MaterialStatePropertyAll(Size(51, 45)),
      ),
      child: const Text(
        "Edit",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String name;

  const _Title({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff071D55),
        ),
      ),
    );
  }
}

class _CircularCheckbox extends StatelessWidget {
  final bool value;
  final Function onChanged;

  const _CircularCheckbox(
      {super.key, required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 32 / Checkbox.width,
      child: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(0xff399649);
          }
          return Colors.white;
        }),
        value: value,
        shape: const CircleBorder(
          side: BorderSide(color: Color(0xff071D55)),
        ),
        onChanged: (bool? value) {
          onChanged();
        },
      ),
    );
  }
}
