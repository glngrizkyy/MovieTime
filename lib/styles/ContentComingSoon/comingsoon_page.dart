part of 'allassetscomingsoon.dart';

class ComingSoonPage extends StatefulWidget {
  ComingSoonPage({Key key}) : super(key: key);

  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                // IconButton(
                //   onPressed: () {
                //     Get.back();
                //   },
                //   icon: Padding(
                //     padding: const EdgeInsets.only(
                //       left: 0,
                //     ),
                //     child: Icon(
                //       Icons.keyboard_arrow_left_rounded,
                //       size: 45,
                //       color: blackColor,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    left: 24,
                  ),
                  child: Text(
                    "Oops!!",
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 68,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 327,
                  width: 327,
                  child: Image.asset(
                    ImagePath.comingsoon,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: [
                Text(
                  "Coming Soon",
                  style: blackTextStyle.copyWith(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Tunggu update dari kami. Fitur ini\nmasih dalam tahap pengembangan\ndan akan segera hadir.',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 18,
            //     right: 18,
            //   ),
            //   child: Container(
            //     width: 339,
            //     height: 54,
            //     child: MaterialButton(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(14),
            //       ),
            //       color: goldColor,
            //       child: Text(
            //         "Kembali Ke Halaman Sebelumnya",
            //         style: blackButtonStyle.copyWith(
            //           fontSize: 18,
            //         ),
            //       ),
            //       onPressed: () {
            //         Get.back();
            //       },
            //     ),
            //   ),

            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
