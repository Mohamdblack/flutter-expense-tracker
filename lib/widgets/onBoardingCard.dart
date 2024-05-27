import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingCard extends StatelessWidget {
  final String image, title, description, buttonText;
  final Function onPressed;

  const OnboardingCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              50.0,
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff1a936f),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
