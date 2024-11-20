import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.arrow_left),
        middle: Text("Cupertino App"),
        trailing: Icon(CupertinoIcons.add),
      ),
      child: Container(
        color: CupertinoColors.white,
      ),
    );
  }
}
