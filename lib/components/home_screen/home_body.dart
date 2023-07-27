import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/components/common/food_card.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';
import 'package:shimmer/shimmer.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = true;
  List<DocumentSnapshot> _items = [];

  Future<void> _fetchFoods() async {
    QuerySnapshot snapshot = await _firestore.collection('food').get();
    setState(() {
      _items = snapshot.docs;
      isLoading = false;
    });
  }

  Widget buildShimmer() {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 57.5, bottom: 25.0, left: 35.0, right: 20.0),
              child: FoodCard(
                foodLabel: '',
                imageUrl: '',
                price: 0,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget imageShimmer() {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Container(
            height: 140,
            width: 140,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 0.0, left: 35, right: 35),
          child: Text(
            'Delicious',
            style: homeTextStyle,
          ),
        ),
        // Align(
        //  alignment: AlignmentDirectional.topStart,
        // child:
        Padding(
          padding: const EdgeInsets.only(
              top: 0.0, bottom: 10.0, left: 35, right: 35),
          child: Text(
            'food for you',
            style: homeTextStyle,
          ),
        ),
        // ),
        Container(
          margin:
              EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0, bottom: 20.0),
          child: SearchBar(
            onTap: () => Navigator.pushNamed(context, '/results'),
            hintText: 'Search',
            hintStyle: MaterialStateProperty.all(TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            )),
            leading: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              iconSize: 18,
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Color(0xFFEFEEEE)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: Color(0xFF9A9A9D),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            labelColor: Color(0xFFFA4A0C),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFFA4A0C)),
                insets: EdgeInsets.symmetric(horizontal: 60.0)),
            tabs: [
              Tab(
                child: Text(
                  'Foods',
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Drinks',
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Snacks',
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Sauce',
                  style: tabTextStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Pasta',
                  style: tabTextStyle,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 57.5),
        Expanded(
          child: TabBarView(
            children: [
              isLoading
                  ? buildShimmer()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _items.length,
                      itemBuilder: (context, int index) {
                        DocumentSnapshot item = _items[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 57.5, bottom: 25.0, left: 35.0, right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/foodInfo',
                                  arguments: item);
                            },
                            child: FoodCard(
                              foodLabel: item['name'],
                              imageUrl: item['image'],
                              price: item['price'],
                            ),
                          ),
                        );
                      },
                    ),
              Center(
                child: Text("It's sunny here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
