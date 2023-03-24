import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';
 
import 'package:delivery_app/src/colors/colors.dart';

class ListTitleChecked extends StatefulWidget {
  
  String texto;
  bool isActive;
  VoidCallback func;

  
  ListTitleChecked({
    super.key, 
    required this.texto,
    required this.isActive,
    required this.func,
  });


  @override
  State<ListTitleChecked> createState() => _ListTitleCheckedState();
}

class _ListTitleCheckedState extends State<ListTitleChecked> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _listTitles( 
          context: context, 
          title: widget.texto, 
          isActive: widget.isActive, 
          fnAction: widget.func,
        ),
      ],
    );
  }
}

Widget _listTitles({ 
    required BuildContext context, 
    required String title, 
    required bool isActive, 
    required VoidCallback fnAction 
  }) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      )
    ),
    child: ListTile(
      onTap: fnAction,
      title: HeaderText(
        text: title,
        color: isActive ? orange : Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 17.0
      ),
      trailing: isActive ? Icon(Icons.check, color: orange,) : null,
    ),
  );
}