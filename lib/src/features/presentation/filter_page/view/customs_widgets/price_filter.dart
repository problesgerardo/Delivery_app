import 'package:flutter/material.dart';
import 'package:delivery_app/src/colors/colors.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {

  //Properties
  RangeValues _values = RangeValues(0.0, 0.5);
  int _minPrice = 0;
  int _maxPrice = 0;



  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only( bottom: 40.0 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('$_minPrice', style: TextStyle( fontSize: 16),),
          Container(
            width: size.width * 0.8,
            child: RangeSlider(
              activeColor: orange,
              inactiveColor: grey,
              values: _values,
              min: 0,
              max: 200.0,            
              onChanged: (RangeValues value) {
                setState(() {
                  _values = value;
                  _minPrice = value.start.round();
                  _maxPrice = value.end.round();
                });
                
              }, 
            ),
          ),
          Text('$_maxPrice', style: TextStyle( fontSize: 16),),
        ],
      ),
    );
  }
}