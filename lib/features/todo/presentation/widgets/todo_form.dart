import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/shared_styles.dart';

class TodoForm extends StatefulWidget {
  TodoForm({super.key, this.initialName, required this.onSave});

  final String? initialName;
  final void Function(String) onSave;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  @override
  void initState() {
    if (widget.initialName != null) {
      _nameController.text = widget.initialName!;
    }
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, top: 39),
      child: Form(
        child: Column(
          children: [
            _NameField(
              nameController: _nameController,
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: _DoneButton(
                    onSave: widget.onSave, nameController: _nameController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoneButton extends StatelessWidget {
  const _DoneButton({
    required this.onSave,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final void Function(String p1) onSave;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff3556AB),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff0D2972), width: 2),
                borderRadius: BorderRadius.circular(9))),
        onPressed: () {
          if (Form.of(context).validate()) {
            onSave(_nameController.text);
          }
        },
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 61,
            child: Text(
              "Done",
              style: TextStyle(shadows: [SharedStyles.textShadow]),
            )));
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text("Task name"),
          ),
          const SizedBox(height: 14),
          TextFormField(
            validator: (val) =>
                val?.isNotEmpty == true ? null : "Todo name can't be empty",
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffCBCBCB), width: 2),
                  borderRadius: BorderRadius.circular(9),
                )),
            controller: _nameController,
          ),
        ],
      ),
    );
  }
}
