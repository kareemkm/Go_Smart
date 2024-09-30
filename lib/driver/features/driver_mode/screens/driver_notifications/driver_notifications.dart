import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/common/widgets/dialogs/offline_alert_dialog.dart';
import 'package:go_smart/driver/features/driver_mode/screens/driver_notifications/widgets/driver_notification.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class DriverNotificationsScreen extends StatefulWidget {
  const DriverNotificationsScreen({super.key});

  @override
  State<DriverNotificationsScreen> createState() =>
      _DriverNotificationsScreenState();
}

class _DriverNotificationsScreenState extends State<DriverNotificationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkInternetConnection(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
          showBackArrow: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CCircularContainer(
              onTap: () {
                // going to profile tap
                // Get.find<NavigationMenuController>().setSelectedTap(4);
              },
              child: SvgPicture.asset(CImages.account),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CCircularContainer(
                  onTap: () {
                    // Get.to(() => const NotificationsScreen());
                  },
                  child: const Icon(
                    Icons.dark_mode_outlined,
                    size: 50,
                    color: CColors.primary,
                  ),
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome To Go Smart Help Team",
              style: CTextStyles.textStyle20,
            ),
            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, i) => DriverNotificationWidget(
                  title: 'New Request',
                  subtitle:
                      "New Ride!  [User Name] is waiting in Cairo. Tap to accept and navigate.",
                  isLast: i == 2,
                  isNew: i == 0,
                ), // todo notification widget
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkInternetConnection(BuildContext context) {
    bool isConnected = false;

    if (!isConnected) {
      showDialog(context: context,builder: (context) => const COfflineAlertDialog());
    }
  }
}
