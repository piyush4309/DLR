import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:land_registration/constant/constants.dart';
import 'package:universal_html/html.dart' as html;
import '../constant/utils.dart';

class LeftDescription extends StatelessWidget {
  const LeftDescription({Key? key}) : super(key: key);
  static final appContainer = kIsWeb
      ? html.window.document.querySelectorAll('flt-glass-pane')[0]
      : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // title
        const FittedBox(
          child: Text('''Decentralized Land Registration''',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.lightGreen,
                fontSize: 50,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                //letterSpacing: 1.5,
              )),
        ),

        // Description

        const SizedBox(
          height: 20,
        ),
        // const FittedBox(
        //   child: Text('''This application is for government officials, land Buyers and land sellers. land sellers 
        //   should login through user portal and add lands and allow requests. Land buyers should login through users
        //   portal to check available lands and send request to sellers. Government offcials should login through 
        //   government officials portal and verify users and lands and transactions. Admin can add land inspectors 
        //   for different areas.''',
        //       style: TextStyle(
        //         fontFamily: 'Poppins',
        //         color: Color(0xFF000000),
        //         fontSize: 30,
        //         fontWeight: FontWeight.w200,
        //         fontStyle: FontStyle.normal,
        //         //letterSpacing: 1.5,
        //       )),
        // ),
        Row(
          children: <Widget>[
            // button
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //       width: 150,
            //       height: 57,
            //       child: const Center(
            //         child: Text("Learn More",
            //             style: TextStyle(
            //               fontFamily: 'Poppins',
            //               color: Color(0xffffffff),
            //               fontSize: 14,
            //               fontWeight: FontWeight.w400,
            //               fontStyle: FontStyle.normal,
            //               letterSpacing: 2,
            //             )),
            //       ),
            //       decoration: BoxDecoration(
            //           color: const Color(0xff47afc9),
            //           borderRadius: BorderRadius.circular(8))),
            // ),
            //
            const SizedBox(width: 40),
          ],
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
