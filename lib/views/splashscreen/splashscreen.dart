part of 'splashscreenfitur.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3500), () => Get.off(NavbarPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImagePath.logomovietime,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: new Row(
                  children: <Widget>[
                    VerticalDivider(
                      color: goldColor,
                      thickness: 2,
                      width: 30,
                    ),
                    Container(
                      child: Text(
                        'Movie\nTime',
                        style: mainTextStyle.copyWith(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
