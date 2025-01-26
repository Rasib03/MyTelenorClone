import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class Payments {
  Future<void> makePayment() async {
    try {
      // Step 1: Fetch payment intent from your local server via ngrok
      final response = await http.post(
        Uri.parse(
            'https://e39c-39-41-140-215.ngrok-free.app/create-payment-intent'), // Use your ngrok URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'amount': 1000}), // Amount in cents (e.g., $10.00)
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

        print('Payment successful!');
      } else {
        print('Failed to fetch payment intent: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
