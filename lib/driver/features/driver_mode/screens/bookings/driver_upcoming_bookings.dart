import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/driver/features/driver_mode/screens/bookings/widgets/driver_booking_widget.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class DriverUpcomingBookings extends StatelessWidget {
  const DriverUpcomingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(title: "Upcoming Bookings"),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemBuilder: (context, i) => DriverBookingWidget(
            title: "Kempinski Nile Hotel Cairo",
            subtitle: "Cairo",
            type: "(Full Day trip)",
            cost: r"150$ Per day",
            date: "25/5/2024",
            isLast: i == 2,
          ),
        ),
      ),
    );
  }
}
