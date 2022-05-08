import 'package:flutter/material.dart';
import 'package:inpaket/Configers/configers.dart';

class OrderFoodScreen extends StatefulWidget {
  const OrderFoodScreen({Key? key}) : super(key: key);

  @override
  _OrderFoodScreenState createState() => _OrderFoodScreenState();
}

class _OrderFoodScreenState extends State<OrderFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(noData)),
        ),
      ),
    );
  }
}
