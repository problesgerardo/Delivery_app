import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';


class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({super.key});

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnDog = false;
  bool btnCat = false;
  bool btnBird = false;
  bool btnFish = false;
  bool btnCow = false;
  bool btnHorse = false;
  bool btnMokey = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() { 
              setState(() => btnDog = !btnDog );
             }, btnDog, "Dog's"),
            _roundedButtonFilter(() { 
               setState(() => btnCat = !btnCat );
            }, btnCat, "Cat's"),
            _roundedButtonFilter(() { 
               setState(() => btnFish = !btnFish );
            }, btnFish, "Fish"),
            _roundedButtonFilter(() { 
               setState(() => btnBird = !btnBird );
            }, btnBird, "Bird's"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() { 
              setState(() => btnCow = !btnCow );
            }, btnCow, "Cow's"),
            _roundedButtonFilter(() { 
              setState(() => btnHorse = !btnHorse );
            }, btnHorse, "Horse"),
            _roundedButtonFilter(() { 
              setState(() => btnMokey = !btnMokey );
            }, btnMokey, "Mokey"),
          ],
        )
      ],
    );
  }
}

Widget _roundedButtonFilter( VoidCallback funcAction, bool isActive, String labelText ) {
  return ElevatedButton(
    onPressed: funcAction, 
    style: ElevatedButton.styleFrom(
      elevation: 0.5,
      primary: Colors.white,
      onPrimary: orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 30.0 ),
        side: BorderSide(
          color: isActive ? orange : grey,
        )
      ),
    ),
    child: Text(
      labelText,
      style: TextStyle(
        color: isActive ? orange : grey,
      ),
    ),
  );
}