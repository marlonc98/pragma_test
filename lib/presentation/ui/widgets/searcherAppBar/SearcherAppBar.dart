import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearcherAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onSearch;
  final String title;
  final bool waitSearch;

  SearcherAppBar(
      {Key? key,
      required this.title,
      required this.onSearch,
      this.waitSearch = false})
      : super(key: key);

  @override
  SearcherAppBarState createState() => SearcherAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class SearcherAppBarState extends State<SearcherAppBar> {
  bool searching = false;
  final TextEditingController _textController = TextEditingController();

  void _onKeyDownSearch(String? val) {
    if (widget.waitSearch) {
      if (val == null) {
        return;
      }
      Timer(Duration(milliseconds: 500), () async {
        await widget.onSearch.call(val);
      });
    } else {
      widget.onSearch.call(val ?? "");
    }
  }

  void toogleSearch(bool value) {
    setState(() {
      searching = value;
    });
  }

  @override
  SliverAppBar build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        floating: true,
        title: searching
            ? Container(
                child: Row(
                  children: [
                    Expanded(
                        child: CupertinoSearchTextField(
                      padding: EdgeInsets.all(12),
                      controller: _textController,
                      onChanged: _onKeyDownSearch,
                      onSubmitted: widget.onSearch,
                      style: TextStyle(
                        color: Theme.of(context).appBarTheme.iconTheme?.color,
                      ),
                    )),
                    IconButton(
                        onPressed: () => toogleSearch(false),
                        icon: Icon(Icons.close))
                  ],
                ),
              )
            : Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                        onPressed: () => toogleSearch(true),
                        icon: Icon(Icons.search))
                  ],
                ),
              ));
  }
}
