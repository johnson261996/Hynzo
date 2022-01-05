
import 'dart:io' show Platform;
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferralWidget extends StatefulWidget {
  @override
  _ReferralWidgetState createState() => _ReferralWidgetState();
}

class _ReferralWidgetState extends State<ReferralWidget> {
  String text = 'Install hynzo its have games and chatting feauture helps you to connect with friends and families.';
  String subject = 'http://hynzo.com/invite/';

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      extendBody: true,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: ()async {

                    Navigation.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                    ),
                    child: Image.asset(
                      'assets/images/top_back.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width * 0.02,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:mediaQuery.width * 0.2),
              child: Text(
                "Refer & Win",
                textAlign: TextAlign.center,
                style: GoogleFonts.breeSerif().copyWith(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  shadows: [
                    BoxShadow(
                      color: AppColors.blueDark,
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
            ),

            Container(
                width: mediaQuery.width * 1,
              margin: EdgeInsets.only(right: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Padding(

                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset(
                      'assets/images/coin.png',
                      width: 25.0,
                      height: 25.0,
                    ),
                ),
                  Text(
                    "1000 Hynzo Coins",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.breeSerif().copyWith(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      shadows: [
                        BoxShadow(
                          color: AppColors.blueDark,
                          blurRadius: 5,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                  ),
                ])


            ),

            Container(
              height: 200.0,
              width: 200.0,
              margin: EdgeInsets.only(top:mediaQuery.width * 0.1),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/refer.png',),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Invite your friends to sign up",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Container(
              height: mediaQuery.height * 0.06,
              width: mediaQuery.width * 0.9,
              padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              margin: EdgeInsets.only(top:mediaQuery.width * 0.1),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Text(
                    "N5ALMDU5",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.content_copy,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Text(
                    "CopyCode",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              )
            ),
            Container(
              height: mediaQuery.height * 0.2,
              width: mediaQuery.width * 1,

               child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                 SizedBox(
                   height: 50,
                   width: 160,
                   child: ElevatedButton.icon(
                   onPressed: (){
                     launchWhatsApp();
                     //openwhatsapp(context);
                   },
                   label: Text('Whatsapp'),
                   icon: Image.asset('assets/images/whatsapp.png',width: 20,height: 20,),
                   style: ElevatedButton.styleFrom(
                     primary: Colors.green,
                   ),
               ),
                 ),

                SizedBox(
                  height: 50,
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed:() {
                        final RenderBox box = context.findRenderObject() as RenderBox ;
                        Share.share(text,
                        subject: subject,
                        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                    },
                    label: Text('More Option'),
                    icon: Image.asset('assets/images/share.png',width: 20,height: 20,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                ]
               )
            )


        ])

        ),

      ),
    );
  }
}

openwhatsapp(BuildContext context) async{
  var whatsapp ="+918861438231";
  var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
  var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if(Platform.isIOS){
    // for iOS phone only
    if( await canLaunch(whatappURL_ios)){
      await launch(whatappURL_ios, forceSafariVC: false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));
    }
  }else{
    // android , web
    if( await canLaunch(whatsappURl_android)){
      await launch(whatsappURl_android);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));
    }
  }
}

launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+001-(555)1234567',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  await launch('$link');
}