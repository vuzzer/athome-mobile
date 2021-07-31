import 'package:flutter/material.dart';

class DividerComponent extends StatelessWidget {
  DividerComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Divider(
              endIndent: 10,
              color: Colors.grey.withOpacity(0.3),
              thickness: 2,
            ),
          ),
          Text(
            'Ou',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            flex: 2,
            child: Divider(
              indent: 10,
              color: Colors.grey.withOpacity(0.3),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
