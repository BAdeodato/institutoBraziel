import 'package:flutter/material.dart';

class GenericButtomUp extends StatefulWidget {
  final String? text;  
  const GenericButtomUp({super.key, this.text});

  @override
  State<GenericButtomUp> createState() => _GenericButtomUp();
}

class _GenericButtomUp extends State<GenericButtomUp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE6E6E6)),
        ),
        child: Align(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                    child: Text(
                      widget.text ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
