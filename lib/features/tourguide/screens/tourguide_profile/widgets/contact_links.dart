import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/widgets/contact_button.dart';

class ContactLinks extends StatelessWidget {
  const ContactLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContactButton(onTap: (){}, title:"Whatsapp", icon: FontAwesomeIcons.whatsapp),
        ContactButton(onTap: (){}, title:"Phone", icon: Icons.phone_outlined,),
        ContactButton(onTap: (){}, title:"messenger", icon: FontAwesomeIcons.facebookMessenger,),
      ],
    );
  }
}
