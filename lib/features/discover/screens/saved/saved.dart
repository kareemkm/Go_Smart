import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/features/discover/screens/saved/widgets/tab_view.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CAppBar(title: "Saved",showBackArrow: false,),
        body: Column(
          children: [
            TabBar(
                labelStyle: CTextStyles.textStyle14.copyWith(color: Colors.black),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: CColors.darkGrey,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: "Hotels"),
                  Tab(text: "Restaurants"),
                  Tab(text: "Activity"),
                ]),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: CSizes.sm),
                child: TabBarView(children: [
                  CTabView(data: [[CImages.hotel1,"Kempinski Nile  Cairo","Cairo"]],),
                  CTabView(data: [[CImages.food2,"Koshary Abou Tarek","Cairo"]],),
                  CTabView(data: [[CImages.landmark4,"The Royal Jewelry Museum","Alexandria"]],),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
