import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/components/common/drawer_list_tile.dart';
import 'package:food_delivery_app/constants/app_keys.dart';
import 'package:food_delivery_app/constants/constants.dart';
import '../services/auth.dart';
import '../utils/ui_constants.dart';
import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      openRatio: 0.51,
      openScale: 0.65,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFFA4A0C)),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Color(0xFFF2F2F2),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              toolbarHeight: 100,
              leadingWidth: 66,
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.menu : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              backgroundColor: Color(0xFFF2F2F2),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: FaIcon(FontAwesomeIcons.cartShopping),
                    iconSize: 18,
                  ),
                )
              ],
            ),
          ),
          body: HomeBody(),
          bottomNavigationBar: BottomAppBar(
            elevation: 0.0,
            color: Color(0xFFF2F2F2),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                bottom: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Color(0xFFFA4A0C),
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.house),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favouriteFoods');
                    },
                    icon: FaIcon(FontAwesomeIcons.heart),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/personalDetails');
                    },
                    icon: FaIcon(FontAwesomeIcons.user),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10.0),
          alignment: Alignment.center,
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(
                  flex: 4,
                ),
                DrawerListTile(
                    icon: Icon(Icons.account_circle_outlined),
                    title: 'Profile'),

                DrawerListTile(
                    icon: Icon(Icons.shopping_cart_checkout), title: 'Orders'),

                DrawerListTile(
                    icon: Icon(Icons.local_offer_outlined),
                    title: 'offer and promo'),

                DrawerListTile(
                    icon: Icon(Icons.sticky_note_2_outlined),
                    title: 'Privacy policy'),

                DrawerListTile(
                    icon: Icon(Icons.security),
                    title: 'Security',
                    isDivider: false),
                Spacer(
                  flex: 10,
                ),

                ListTile(
                  onTap: () async {
                    try {
                      await AuthService().firebaseSignOut();
                      getStorage.remove(AppKey.userData);
                      Navigator.pushReplacementNamed(context, '/login');
                    } catch (e) {
                      print(e);
                    }
                  },
                  title: Text('Sign-out', style: profileLabelStyle),
                ),
                Spacer(
                  flex: 2,
                ),
                // Text('Sign-out -->', style: profileLabelStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
