import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:my_telenor/data/package.dart';

class Payments {
  Future<void> makePayment(int amount, Function() onComplete) async {
    try {
      // Step 1: Fetch payment intent from your local server via ngrok
      final response = await http.post(
        // must replace the end-point with the end-point that you will get from ngrok.
        Uri.parse(
            'https://bc72-39-41-140-215.ngrok-free.app/create-payment-intent'), // Use your ngrok URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'amount': amount * 100}), // Amount in cents (e.g., $10.00)
      );

      if (response.statusCode == 200) {
        final paymentIntent = jsonDecode(response.body);

        // Step 2: Initialize the payment sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent['clientSecret'],
            merchantDisplayName: 'My Telenor',
          ),
        );

        // Step 3: Present the payment sheet
        await Stripe.instance.presentPaymentSheet();

        final Package _p = Package();

        _p.addInternet(300);
        _p.addOffnet(1500);
        _p.addOnnet(10000);

        onComplete();
      } else {
        throw (response.body);
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
