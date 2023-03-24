
import 'package:delivery_app/src/features/presentation/filter_page/view/customs_widgets/list_title_checked.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/customs_widgets/price_filter.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/customs_widgets/cuisines_filters.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  bool topRated = false;
  bool nearMe = false;
  bool costHightToLow = false;
  bool costLowToHight = false;
  bool mostPopular = false;

  bool openNow = false;
  bool creditCart = false;
  bool alcoholService = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only( top: 15.0, bottom: 5.0, left: 15.0 ),
                  child: HeaderText(
                    text: 'CATEGORIES',
                    color: grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: 15.0 ),
                  child: CuisinesFilter()
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only( top: 15.0, bottom: 5.0, left: 15.0 ),
                  child: HeaderText(
                    text: 'SORT BY',
                    color: grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0
                  ),
                ),
                
                _sortByContainer(),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only( top: 15.0, bottom: 15.0, left: 15.0 ),
                  child: HeaderText(
                    text: 'FILTER',
                    color: grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0
                  ),
                ),

                _filterContainer(),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only( top: 15.0, bottom: 15.0, left: 15.0 ),
                  child: HeaderText(
                    text: 'PRICE',
                    color: grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0
                  ),
                ),

                PriceFilter(),
                
              ]
            )
          )
        ],
      ),
    );
  }

  Widget _sortByContainer() {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 15.0 ),
      child: Column(
        children: [
          ListTitleChecked( 
            texto: 'Top Rated', 
            isActive: topRated, 
            func: (){ 
              setState(() => topRated = !topRated); 
            },
          ),
          ListTitleChecked( 
            texto: 'Nearest Me', 
            isActive: nearMe, 
            func: (){ 
              setState(() => nearMe = !nearMe); 
            },
          ),
          ListTitleChecked( 
            texto: ' Cost Hight to Low', 
            isActive: costHightToLow, 
            func: (){ 
              setState(() => costHightToLow = !costHightToLow); 
            },
          ),
          ListTitleChecked( 
            texto: 'Cost Low to Hight', 
            isActive: costLowToHight, 
            func: (){ 
              setState(() => costLowToHight = !costLowToHight); 
            },
          ),
          ListTitleChecked( 
            texto: 'Most Popular', 
            isActive: mostPopular, 
            func: (){ 
              setState(() => mostPopular = !mostPopular); 
            },
            ),
        ],
      ),
    );
  }

  Widget _filterContainer() {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 15.0 ),
      child: Column(
        children: [
          ListTitleChecked( 
            texto: 'Open now', 
            isActive: openNow, 
            func: (){ 
              setState(() => openNow = !openNow); 
            },
          ),
          ListTitleChecked( 
            texto: 'Credit card', 
            isActive: creditCart, 
            func: (){ 
              setState(() => creditCart = !creditCart); 
            },
          ),
          ListTitleChecked( 
            texto: 'Alcohol served', 
            isActive: alcoholService, 
            func: (){ 
              setState(() => alcoholService = !alcoholService); 
            },
          ),
        ],
      ),
    );
  }
}

_appBar( BuildContext context) {
  return AppBar(
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: HeaderText(
      text: "Filters",
      fontWeight: FontWeight.w600,
    ),
    leading: Container(
      padding: EdgeInsets.only( top: 20.0, left: 8.0 ),
      child: HeaderText(
        text: "Reset",
        fontWeight: FontWeight.w500,
        fontSize: 17.0
      ),
    ),
    actions: [
       GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
        padding: EdgeInsets.only( top: 20.0, right: 10.0 ),
        child: HeaderText(
          text: "Done",
          color: orange,
          fontWeight: FontWeight.w500,
          fontSize: 17.0
        ),
          ),
      ),
    ],
  );
}