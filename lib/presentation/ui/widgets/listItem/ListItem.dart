import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String? title, value;
  ListItem({
    key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
        ),
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Container(
            padding: EdgeInsets.only(right: 8, bottom: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                this.title != null
                    ? Text(this.title!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ))
                    : Container(),
                this.title != null && this.value != null
                    ? SizedBox(
                        height: 2,
                      )
                    : Container(),
                this.value != null
                    ? Text(
                        this.value ?? "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    : Container(),
              ],
            )));
  }
}
