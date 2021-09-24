part of 'navbar_fitur.dart';

class NavbarPage extends StatefulWidget {
  NavbarPage({Key key}) : super(key: key);

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.amber,
      ),
    );
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          leading: GestureDetector(
            onTap: () => _pageController.jumpToPage(0),
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(
                left: 18,
              ),
              child: Image.asset(
                ImagePath.logomovietime,
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(
              left: 18,
            ),
            child: Text(
              (() {
                if (_page == 0) {
                  return "Home";
                } else if (_page == 1) {
                  return "Search";
                } else if (_page == 2) {
                  return "Profile";
                } else {
                  print('No More Navbar');
                }
              })(),
              style: mainTStyle.copyWith(fontSize: 20),
            ),
          ),
          actions: [
            Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(
                right: 30,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Get.toNamed('/ComingS');
                  });
                },
                child: Image.asset(
                  (() {
                    if (_page == 0) {
                      return ImagePath.notif;
                    } else if (_page == 1) {
                      return ImagePath.notif;
                    } else if (_page == 2) {
                      return ImagePath.settings;
                    } else {
                      print('No More Image Navbar');
                    }
                  })(),
                  color: mainColor,
                ),
              ),
            ),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            HomePage(),
            ComingSoonPage(),
            ComingSoonPage(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          key: NavbarKey.getKey(),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 7,
              ),
              Container(
                width: 52,
                height: 52,
                child: MaterialButton(
                  child: Image.asset(
                    ImagePath.home,
                    color: _page == 0 ? skyPinkColor : goldColor,
                  ),
                  onPressed: () => _pageController.jumpToPage(0),
                ),
              ),
              Container(
                width: 0,
                height: 0,
                child: MaterialButton(
                  child: Image.asset(
                    ImagePath.search,
                    color: _page == 1 ? whiteColor : goldColor,
                  ),
                  onPressed: () => _pageController.jumpToPage(1),
                ),
              ),
              Container(
                width: 52,
                height: 52,
                child: MaterialButton(
                  child: Image.asset(
                    ImagePath.profile,
                    color: _page == 2 ? skyPinkColor : goldColor,
                  ),
                  onPressed: () => _pageController.jumpToPage(2),
                ),
              ),
              SizedBox(
                width: 18,
              ),
            ],
          ),
          color: mainColor,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: showFab
            ? FloatingActionButton(
                backgroundColor: goldColor,
                hoverColor: mainColor,
                focusColor: mainColor,
                foregroundColor: mainColor,
                splashColor: mainColor,
                elevation: 5.0,
                child: Container(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    ImagePath.search,
                    color: _page == 1 ? skyPinkColor : skyBlueColor,
                  ),
                ),
                onPressed: () => _pageController.jumpToPage(1),
              )
            : null,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
