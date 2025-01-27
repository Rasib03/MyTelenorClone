from flask import Flask, jsonify, request
import stripe

app = Flask(__name__)

# Set your Stripe secret key
stripe.api_key = "sk_test_51QkpamFhS7fUusM3ky9R1tpl75meFhAYm2ScTKGCykmbJ4vA8lKOhqxY4h50qe1OZqd5AvxfmFg5Amgh4r7QCDmp00pag73zYM"  # Replace with your Stripe secret key

@app.route('/create-payment-intent', methods=['POST'])
def create_payment_intent():
    try:
        # Get the amount from the request body
        data = request.get_json()
        amount = data['amount']  # Amount in cents (e.g., $10.00 = 1000)

        # Create a PaymentIntent
        payment_intent = stripe.PaymentIntent.create(
            amount=amount,
            currency='usd',
        )

        # Return the client secret
        return jsonify({
            'clientSecret': payment_intent['client_secret']
        }), 200

    except Exception as e:
        return jsonify(error=str(e)), 500

if __name__ == '__main__':
    app.run(port=3000)  # Run the server on port 3000




# curl -X POST http://localhost:3000/create-payment-intent \
#      -H "Content-Type: application/json" \
#      -d '{"amount": 1000}'

# {
#     "clientSecret": "pi_1JH4Y2F2eZvKYlo2C3q2X6bG_secret_xyz"
# }
#ngrok authtoken YOUR_AUTH_TOKEN
#ngrok http 3000