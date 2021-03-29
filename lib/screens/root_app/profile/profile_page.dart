import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/components/order_status_label.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/screens/root_app/profile/order_detail_screen.dart';
import 'package:food_insta/screens/root_app/profile/post_detail_screen.dart';
import 'package:food_insta/screens/root_app/qr_code/deal_completed.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/models/order.dart';
import 'package:food_insta/models/post.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Order> orders = [
    Order(
        orderedTo: "Ayush grawal",
        createdTime: "26-03-2021 15:06:04",
        image: null,
        orderStatus: ORDERSTATUS.PENDING),
    Order(
        orderedTo: "Ayush kumar",
        createdTime: "26-03-2021 15:06:04",
        image: null,
        orderStatus: ORDERSTATUS.APPROVED),
    Order(
        orderedTo: "Ayush pandey",
        createdTime: "26-03-2021 15:06:04",
        image: null,
        orderStatus: ORDERSTATUS.COMPLETED),
    Order(
        orderedTo: "kunal grawal",
        createdTime: "26-03-2021 15:06:04",
        image: null,
        orderStatus: ORDERSTATUS.APPROVED)
  ];
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomAppBar(
            actions: [
              CustomIconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DealCompletedPage()));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Styles.iconColor,
                ),
              )
            ],
          ),
        ),

        // Body
        Expanded(
          child: SingleChildScrollView(
            child: ProfileCard(
              children: [
                SizedBox(height: 8),
                Divider(),
                buildTabs(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildTabs(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    Color tileColor =
        darkThemeProvider.darkTheme ? Styles.black2 : Styles.tileColorLight;
    return DefaultTabController(
      length: 2,
      initialIndex: 0, // Change it according to user type
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: TabBar(
              labelColor:
                  darkThemeProvider.darkTheme ? Colors.white : Styles.black1,
              unselectedLabelColor:
                  darkThemeProvider.darkTheme ? Colors.white70 : Styles.black2,
              tabs: [
                Tab(text: 'MY POSTS'),
                Tab(text: 'MY ORDERS'),
              ],
            ),
          ),
          Container(
              height: 400, //height of TabBarView
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TabBarView(children: <Widget>[
                  buildPostsTab(tileColor),
                  buildOrdersTab(tileColor),
                ]),
              ))
        ],
      ),
    );
  }

  Widget buildPostsTab(Color tileColor) {
    return Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostDetail()));
                  },
                  tileColor: tileColor,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 48,
                      height: 48,
                      child: Image(
                        image: AssetImage('assets/food_large.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Icon(MdiIcons.accountGroup,
                          color: Styles.customRequestButtonColor),
                      SizedBox(width: 8),
                      Text('36'),
                      Spacer(),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Icon(MdiIcons.weight, color: Styles.blueIconColor),
                      SizedBox(width: 8),
                      Text(
                        '50 kg',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                    ],
                  ),
                  trailing: CustomIconButton(
                    color: Styles.iconColor,
                    height: double.infinity,
                    elevation: 0,
                    onPressed: () {},
                    icon: Icon(
                      MdiIcons.qrcode,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, i) => SizedBox(height: 12),
            itemCount: 10));
  }

  Widget buildOrdersTab(Color tileColor) {
    return Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetail(
                                  orderstatus: ORDERSTATUS.APPROVED,
                                )));
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  tileColor: tileColor,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/placeholder_img.png'),
                    radius: 34,
                  ),
                  title: SizedBox(
                    height: 28,
                    child: Text(
                      'Aggarwal Sweets',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  subtitle: Wrap(
                    children: [
                      OrderStatusLabel(
                        orderstatus: ORDERSTATUS.COMPLETED,
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, i) => SizedBox(height: 12),
            itemCount: 10));
  }
}
