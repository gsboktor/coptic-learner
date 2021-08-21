import 'package:arabic_app/TrialByError.dart';
import 'package:arabic_app/size_config.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arabic ESL Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserConsent(),
    );
  }
}

class UserConsent extends StatefulWidget{

  UserConsent({Key key}) : super(key: key);

  @override
  _UserConsentState createState() => _UserConsentState();
}

class _UserConsentState extends State<UserConsent>{

  bool _agree = true;
  bool _disagree = false;

  Widget _userConsentBody(){
    return Expanded(child: Container(
      width: SizeConfig.safeBlockHorizontal * 80,
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 4),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.blue, size: 30,),
                    Container(width: SizeConfig.safeBlockHorizontal * 3,),
                    Text("What we do.", style: sansStyleSubHeader),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 70,
                height: SizeConfig.safeBlockVertical * 18,
                child: Flexible(
                  child: Text(
                    "Different exercises require a log of attempts that measure a User's progress. Logs are useful for ESL exercises and visualizations for teachers and other professionals to have a better grasp of how non native speakers learn.",
                    textAlign: TextAlign.left,
                    style: sansStyleText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.blue, size: 30,),
                    Container(width: SizeConfig.safeBlockHorizontal * 3,),
                    Text("How we do it.", style: sansStyleSubHeader),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 70,
                height: SizeConfig.safeBlockVertical * 16,
                child: Flexible(
                  child: Text(
                    "Every User has local storage of their answers and attempts when participating in different tasks. If the User decides to Opt-in to using their answers and data, this information will be remotely uploaded and repurposed for later use.",
                    textAlign: TextAlign.left,
                    style: sansStyleText,
                  ),
                ),
              ),
              Container(
                  width: SizeConfig.safeBlockHorizontal * 70,
                  child: Text("User Decision will in no way impact the utility of this application.", style: sansStyleLightText,))
            ],
          ),
        ),
     )
    );
  }

  Widget _userAgreementSelection(){
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: SizeConfig.safeBlockVertical * 30,
        child: Center(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 85,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1.2),
                      child: Material(
                        child: Checkbox(
                          value: _agree,
                          onChanged: (value) => {
                            setState(()=>{_disagree = _agree, _agree = value}),
                            print("agree: " + _agree.toString() + " disagree: " + _disagree.toString()),
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text("I Agree to letting my answers and participation in this application be used and repurposed for educational reasons",
                        style: sansStyleText,
                      ),
                    )
                  ],
                ),
                Container(height: SizeConfig.safeBlockVertical * 3,),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1.2),
                      child: Material(
                        child: Checkbox(
                          value: _disagree,
                          onChanged: (value) => {
                            setState(()=>{_agree = _disagree, _disagree = value}),
                            print("agree: " + _agree.toString() + " disagree: " + _disagree.toString()),
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text("I Disagree to letting my answers and participation in this app be used for any reason.",
                        style: sansStyleText,
                      ),
                    )
                  ],
                ),
                Container(height: SizeConfig.safeBlockVertical * 3,),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TrialByError()))
                  },
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 80,
                    height: SizeConfig.safeBlockVertical * 6,
                    child: Center(child: Text("Let's Go", style: sansStyleTextButton,)),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  Widget _userConsentTitle(){
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 13,
      decoration: BoxDecoration(
        color: Colors.white,
    ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Consent Agreement.",
              style: sansStyle,
            ),
            Text(
              "Agreement to use User information.",
              style: sansStyleLight,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              _userConsentTitle(),
              _userConsentBody(),
              _userAgreementSelection(),
            ],
          ),
        ),
      )
    );
  }

}

