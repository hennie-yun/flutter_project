import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});


  @override
  _BudgetPageState createState() => _BudgetPageState();

}
class _BudgetPageState extends State<BudgetPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        body: SafeArea(
            child : Text(
                '내자산~~~~~~~~ '
            )

        )
    );
  }
}


