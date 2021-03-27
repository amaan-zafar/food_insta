import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart';

class DealCompletedPage extends StatelessWidget {
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
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 18),
                      child: CircleAvatar(
                        backgroundColor: Colors.greenAccent[400],
                        radius: 48,
                        child: Text('DP'),
                      ),
                    ),
                    Text(
                      'Aggarwal Sweets',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'A-41, Sector 47 Gurgaon, Haryana 1010101',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          Text('+91-9313093130',
                              style: Theme.of(context).textTheme.bodyText1)
                        ],
                      ),
                    ),
                    UserTypeLabel(label: 'Business')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
                child: CustomAppCard(
                  width: double.infinity,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 12,
                            backgroundColor: Styles.customApprovedButtonColor,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                        SizedBox(width: 8),
                        Text(
                          'Deal Completed!',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Would you like to rate your experience with this partner?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text('Rating'),
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