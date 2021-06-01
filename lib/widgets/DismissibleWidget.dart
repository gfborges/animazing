import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final Widget child;
  final T item;
  final Function(DismissDirection) onDissmissed;

  const DismissibleWidget({
    @required this.child,
    @required this.item,
    @required this.onDissmissed,
    Key key,
  });
  @override
  Widget build(BuildContext context) => Dismissible(
        direction: DismissDirection.startToEnd,
        key: ObjectKey(item),
        child: child,
        background: buildSwipeAction(),
        onDismissed: onDissmissed,
      );

  buildSwipeAction() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Icon(
        Icons.delete_forever,
        color: Colors.red,
      ),
    );
  }
}
