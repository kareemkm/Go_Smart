import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/models/all_hotels_model.dart';
import 'package:go_smart/features/discover/screens/category_details/hotel_details.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_city_model.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import 'model/one_hotel.dart';

class ExploreHotelsScreen extends StatelessWidget {
  const ExploreHotelsScreen( {super.key, required this.hotels});
  final List<AllHotels> hotels;
  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) =>  Scaffold(
        appBar: CAppBar(
          title: "Explore All Hotels",
          titleStyle: CTextStyles.textStyle20,
          centerTitle: false,
          showBackArrow: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.sliders,
                color: CColors.primary,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              child: CustomSearchTextField(),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Expanded(
              child: ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: CSizes.defaultSpace),
                  child: CDetailCard(
                    isNetworkImage: true,
                    image: hotels[index].image1??'',
                    title:hotels[index].hotelName??'',
                    subtitle:hotels[index].city??'',
                    review: "(13 Review)",
                    additionalText:hotels[index].description??'',
                    isSaved: false,
                    rating: hotels[index].rating??'',
                    onTapViewDetails: () async{
                      await controller.GetOneHotel(hotels[index].id??0);
                      Get.to(() => HotelDetailsScreen(model: controller.Onehotel ?? OneHotel() ,));
                    },
                    margin: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
