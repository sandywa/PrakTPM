import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latianresponsi/model/user_model.dart';
import 'package:latianresponsi/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CardList extends StatelessWidget {
  final UsersModel usersModel;

  CardList(this.usersModel);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "${usersModel.avatarUrl}",
            width: 80,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${usersModel.login}",
            style: blackTextStyle.copyWith(
              fontSize: 18,
            ),
            ),
            SizedBox(
              height: 4,
            ),
            IconButton(onPressed: _launchUrl, icon: Image.asset("name"))
          ],
        ),
      ],
    );
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse("${usersModel.htmlUrl}"))) throw 'Could not launch ${usersModel.htmlUrl}';
  }
}
