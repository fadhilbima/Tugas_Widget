import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  InheritedCounter({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  ValueNotifier<int> count = ValueNotifier(0);

  static InheritedCounter of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
    assert(result != null, 'No InheritedCounter found in context');
    return result!;
  }

  void plus() {
    count.value = count.value+1;
  }

  void min() {
    count.value = count.value-1;
  }

  @override
  bool updateShouldNotify(InheritedCounter old) {
    return false;
  }
}
