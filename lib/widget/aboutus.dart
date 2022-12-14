import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:land_registration/constant/constants.dart';
import 'package:universal_html/html.dart' as html;
import '../constant/utils.dart';

class AboutUs extends StatelessWidget{
    const AboutUs({Key? key}) : super(key: key);
    static final appContainer = kIsWeb
      ? html.window.document.querySelectorAll('flt-glass-pane')[0]
      : null;

    @override
    Widget build(BuildContext context) {
        return Container(
            color: Colors.lightGreen,
            width:900,
            height:400,
            child:Center(
                child:Text(
                    "This application is for government officials, land Buyers and land sellers. land sellers should login through user portal and add lands and allow requests. Land buyers should login through users portal to check available lands and send request to sellers. Government offcials should login through government officials portal and verify users and lands and transactions. Admin can add land inspectors for different areas",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                        color:Colors.white,
                        fontSize: 30,
                    ),
                ),
            ),
        );
    }
}