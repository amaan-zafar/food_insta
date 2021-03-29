import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/components/custom_label.dart';
import 'package:food_insta/theme.dart';

class UserTypeLabel extends StatelessWidget {
  final String label;
  final USERTYPE userType;
  final double fontSize;
  final double horizontalPadding;
  const UserTypeLabel(
      {Key key,
      this.label,
      this.userType,
      this.fontSize = 14,
      this.horizontalPadding = 18})
      : super(key: key);

  String _getUserTypeName(USERTYPE userType) {
    switch (userType) {
      case USERTYPE.NGO:
        return "NGO";
      case USERTYPE.INDIVIDUAL:
        return "Individual";
      case USERTYPE.BUSINESS:
        return "Business";
      case USERTYPE.VOLUNTEER:
        return "Volunteer";
      default:
        return "Business";
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomLabel(
      color: Styles.customApprovedButtonColor,
      label: label == null ? _getUserTypeName(userType) : label,
      fontSize: fontSize,
      horizontalPadding: horizontalPadding,
    );
  }
}
