import 'package:flutter/material.dart';

class BrandName extends StatefulWidget {
  BrandName({Key? key, required this.brandName}) : super(key: key);
  final String brandName;

  @override
  State<BrandName> createState() => _BrandNameState();
}

class _BrandNameState extends State<BrandName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brandName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Text(widget.brandName),
          ),
        ),
      ),
    );
  }
}
