import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Widget CarouselContainer({
    Color? backgroundColor,
    String? imageurl,
    String? step,
    Color? stepButtonBackground,
    Color? steptextcolor,
    String? discription,
    Color? discriptioncolor,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 8, bottom: 8),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: stepButtonBackground,
                ),
                child: Text(step!,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: steptextcolor,
                    ))),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(imageurl!),
          ),
          SizedBox(
            height: 5,
          ),
          Text(discription!,
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: discriptioncolor,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2AA1b8),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset("assets/icons/logo.png"),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Qual è il tuo stile di guida?",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.nunito(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Effettua il test per determinare il tuo stile di guida, bastano pochi giorni e riceverai uno sconto sul prossimo pagamento della tua polizza!",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                Text(
                  "Quali sono i prossimi step?",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 205,
                    enableInfiniteScroll: false,
                    pageSnapping: false,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: [
                  CarouselContainer(
                    backgroundColor: Colors.white,
                    imageurl: "assets/icons/car.png",
                    step: "STEP 1",
                    stepButtonBackground: Color(0xfff3f6f8),
                    steptextcolor: Color(0xff2AA1b8),
                    discription: "Seleziona il tuo\nstile di guida",
                    discriptioncolor: Color(0xff2AA1b8),
                  ),
                  CarouselContainer(
                    backgroundColor: Color(0xffF0FF00),
                    imageurl: "assets/icons/device.png",
                    step: "STEP 2",
                    stepButtonBackground: Color(0xff2AA0B9),
                    steptextcolor: Colors.white,
                    discription:
                        "Autorizza l’accesso ai\ndati del tuo smartphone",
                    discriptioncolor: Color(0xff2AA1b8),
                  ),
                  CarouselContainer(
                    backgroundColor: Color(0xff1288A1),
                    imageurl: "assets/icons/true.png",
                    step: "STEP 3",
                    stepButtonBackground: Color(0xffF0FF00),
                    steptextcolor: Color(0xff2AA0B9),
                    discription: "Controlla il test\nper i prossimi 10 giorni",
                    discriptioncolor: Colors.white,
                  ),
                  CarouselContainer(
                      backgroundColor: Colors.white,
                      imageurl: "assets/icons/cup.png",
                      step: "STEP 4",
                      stepButtonBackground: Color(0xff2AA0B9),
                      steptextcolor: Colors.white,
                      discriptioncolor: Color(0xff2AA1b8),
                      discription: "Termina il test\ne scopri il risultato"),
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return i;
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [1, 2, 3, 4].asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: _current == entry.key ? 25 : 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Center(
                child: Text(
              "INIZIA IL TEST",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff2AA1b8),
              ),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
              color: Color(0xff2AA1b8),
            ),
            child: Center(
                child: Text(
              "NO, CALCOLA PREVENTIVO",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            )),
          )
        ],
      ),
    );
  }
}
