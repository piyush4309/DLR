import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:land_registration/providers/MetamaskProvider.dart';
import 'package:land_registration/constant/loadingScreen.dart';
import 'package:land_registration/screens/registerUser.dart';
import 'package:provider/provider.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../providers/LandRegisterModel.dart';
import '../constant/utils.dart';

class CheckPrivateKey extends StatefulWidget {
  final String val;
  const CheckPrivateKey({Key? key, required this.val}) : super(key: key);

  @override
  _CheckPrivateKeyState createState() => _CheckPrivateKeyState();
}

class _CheckPrivateKeyState extends State<CheckPrivateKey> {
  String privatekey = "";
  String errorMessage = "";
  bool isDesktop = false;
  double width = 590;
  bool _isObscure = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LandRegisterModel>(context);
    var model2 = Provider.of<MetaMaskProvider>(context);
    width = MediaQuery.of(context).size.width;

    if (width > 600) {
      isDesktop = true;
      width = 590;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF272D34),
        title: const Text('Login'),
      ),
      body: Container(
        //width: 500,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            
            // Image.asset(
            //   'assets/authenticate.png',
            //   height: 280,
            //   width: 520,
            // ),
            
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            
            const Text('Click to connect Metamask'),
            ElevatedButton(
              onPressed: () async {
                await model2.connect();
                if (model2.isConnected && model2.isInOperatingChain) {
                  showToast("Connected",
                      context: context, backgroundColor: Colors.green);

                  if (widget.val == "owner") {
                    bool temp = await model2.isContractOwner();
                    if (temp == false) {
                      setState(() {
                        errorMessage = "You are not authrosied";
                      });
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const AddLandInspector()));
                      Navigator.of(context).pushNamed(
                        '/contractowner',
                      );
                    }
                  } else if (widget.val == "UserLogin") {
                    bool temp = await model2.isUserRegistered();
                    if (temp == false) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const RegisterUser()));
                      Navigator.of(context).pushNamed(
                        '/registeruser',
                      );
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const UserDashBoard()));
                      Navigator.of(context).pushNamed(
                        '/user',
                      );
                    }
                  } else if (widget.val == "LandInspector") {
                    bool temp = await model2.isLandInspector();
                    if (temp == false) {
                      setState(() {
                        errorMessage = "You are not authrosied";
                      });
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);

                      Navigator.of(context).pushNamed(
                        '/landinspector',
                      );
                    }
                  }
                  connectedWithMetamask = true;
                } else if (model2.isConnected && !model2.isInOperatingChain) {
                  showToast("Wrong Netword connected,\nConnect Polygon Testnet",
                      context: context, backgroundColor: Colors.red);
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.orange),
              child: Image.network(
                  'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                  width: 280,
                  height: 80),
            ),
            isLoading ? spinkitLoader : Container()
          ],
        ),
      ),
    );
  }
}
