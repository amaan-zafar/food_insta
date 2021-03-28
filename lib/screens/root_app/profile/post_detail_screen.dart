import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/screens/root_app/profile/qrcode_page.dart';
import 'package:food_insta/screens/root_app/profile/requests_page.dart';
import 'package:food_insta/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostDetail extends StatelessWidget {
  String randomImg = 'https://picsum.photos/250?image=9';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomBackground(),
        SafeArea(
          child: Column(
            children: [
              // AppBar
              CustomAppBar(
                actions: [
                  CustomIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Styles.iconColor,
                    ),
                  )
                ],
              ),

              // Body
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
                child: CustomAppCard(
                  width: double.infinity,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://picsum.photos/250?image=9'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 12,
                            top: 4,
                            child: CustomIconButton(
                              onPressed: () {},
                              icon: Icon(
                                MdiIcons.deleteEmpty,
                                color: Styles.customDeclineButtonColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(MdiIcons.accountGroup,
                            color: Styles.blueIconColor),
                        Text(
                          '36',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(MdiIcons.weight, color: Styles.blueIconColor),
                        Text(
                          '50kg',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          '6 hours ago',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'ajfdoiajoisdjfoiakjdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RequestsPage()));
                      },
                      textOnButton: 'Show requests',
                      color: Styles.customRequestButtonColor,
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => QRCodePage()));
                      },
                      textOnButton: 'Show QR code',
                      color: Styles.iconColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
