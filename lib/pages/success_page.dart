import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../services/booking_service.dart';

class SuccessPage extends StatefulWidget {
  final Booking bookingData;
  const SuccessPage({super.key, required this.bookingData});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  Future _postBooking() async {
    try {
      await BookingService().postBooking(booking: widget.bookingData);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh Toán'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile ID: ${widget.bookingData.profileID}'),
            Text('Citizen ID: ${widget.bookingData.citizenID}'),
            Text(
                'Full Name: ${widget.bookingData.firstName} ${widget.bookingData.lastName}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _postBooking().then((_) =>
                        Navigator.popUntil(context, (route) => route.isFirst));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                  ),
                  child: const Text(
                    'Thanh Toán',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/booking');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                  child: const Text(
                    'Hủy',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
