import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:arabic_app/size_config.dart';
import 'constants.dart';

class TrialByError extends StatefulWidget {
  TrialByError({Key key}) : super(key: key);

  @override
  _TrialByErrorState createState() => _TrialByErrorState();
}

class _TrialByErrorState extends State<TrialByError> {
  final myController = TextEditingController();
  VideoPlayerController _controller;
  String text = "";

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://seeingspeech.ac.uk/recording/MRI_vl_bilabial_plosive.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Widget phraseCard() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 75,
      height: SizeConfig.safeBlockVertical * 10,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: .5,
              blurRadius: 7,
              offset: Offset(0, 0),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Nardine mafrud ('inn-u) yimsi",
              style: headerStyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Trial By Error Demo"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  margin:
                  EdgeInsets.only(top: SizeConfig.safeBlockVertical * 10),
                  child: phraseCard()),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 20),
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 75,
                child: TextFormField(
                  controller: myController,
                  decoration: new InputDecoration(
                    labelText: "Enter Translation",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Entry must not be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onEditingComplete: () {
                    setState(() {
                      print("TEST" + myController.text);
                      text = myController.text;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 20),
                child: Text(
                  text,
                  style: headerStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
