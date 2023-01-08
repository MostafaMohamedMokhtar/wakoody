import 'package:flutter/material.dart';

class MyTextFieldDatePicker extends StatefulWidget {
  late final ValueChanged<DateTime> onDateChanged;
  late final DateTime initialDate;
  late final DateTime firstDate;
  late final DateTime lastDate;
  late final FocusNode focusNode;
  late final String labelText;
  late final Icon prefixIcon;
  late final Icon suffixIcon;

  MyTextFieldDatePicker({
    required this.labelText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.focusNode,
    required this.lastDate,
    required this.firstDate,
    required this.initialDate,
    required this.onDateChanged,
  })  : assert(initialDate != null),
        assert(firstDate != null),
        assert(lastDate != null),
        assert(!initialDate.isBefore(firstDate),
            'initialDate must be on or after firstDate'),
        assert(!initialDate.isAfter(lastDate),
            'initialDate must be on or before lastDate'),
        assert(!firstDate.isAfter(lastDate),
            'lastDate must be on or after firstDate'),
        assert(onDateChanged != null, 'onDateChanged must not be null');

  //  super(key: key);

  @override
  _MyTextFieldDatePicker createState() => _MyTextFieldDatePicker();
}

class _MyTextFieldDatePicker extends State<MyTextFieldDatePicker> {
  TextEditingController? _controllerDate;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.initialDate;
    _controllerDate = TextEditingController();
    _controllerDate?.text = '${_selectedDate.day} / ${_selectedDate.month} / ${_selectedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.end,
      textAlignVertical: TextAlignVertical.center,
      focusNode: widget.focusNode,
      controller: _controllerDate,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      //  labelText: widget.labelText,
      ),
      onTap: () => _selectDate(context),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    _controllerDate?.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      _controllerDate?.text = '${_selectedDate.day} / ${_selectedDate.month} / ${_selectedDate.year}';
      widget.onDateChanged(_selectedDate);
    }

    if (widget.focusNode != null) {
      widget.focusNode.nextFocus();
    }
  }
}
