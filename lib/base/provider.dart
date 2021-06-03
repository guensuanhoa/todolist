import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/base/bloc.dart';

typedef BlocBuilderFunction<T extends Bloc<dynamic>> = T Function(BuildContext);

class BlocProvider<T extends Bloc<dynamic>> extends StatefulWidget {
  final Widget child;
  final BlocBuilderFunction<T> builder;

  BlocProvider({
    Key key,
    this.builder,
    this.child,
  }) : super(key: key);

  @override
  _BlocProviderState createState() => _BlocProviderState<T>();

  static T of<T extends Bloc<dynamic>>(BuildContext context) {
    try {
      return Provider.of<T>(context, listen: false);
    } catch (_) {
      throw FlutterError(
        """
        BlocProvider.of() called with a context that does not contain a Bloc of type $T.
        The context used was: $context
        """,
      );
    }
  }
}

class _BlocProviderState<T extends Bloc<dynamic>>
    extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      child: widget.child,
      create: (context) {
        final Bloc b = widget.builder(context);
        b?.init();
        return b;
      },
      dispose: (context, bloc) {
        bloc?.dispose();
      },
    );
  }
}
