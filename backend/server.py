from flask import Flask, jsonify, request
import stripe
from dotenv import load_dotenv
import os
from pathlib import Path


env_path =".env" 
load_dotenv(dotenv_path=env_path)

app = Flask(__name__)

# Set your Stripe secret key
stripe.api_key = os.getenv("STRIPE_SECRET_KEY")


@app.route('/create-payment-intent', methods=['POST'])
def create_payment_intent():
    try:
        # Get the amount from the request body
        data = request.get_json()
        amount = data['amount']  # Amount in cents (e.g., $10.00 = 1000)

        # Create a PaymentIntent
        payment_intent = stripe.PaymentIntent.create(
            amount=amount,
            currency='pkr',
        )

        # Return the client secret
        return jsonify({
            'clientSecret': payment_intent['client_secret']
        }), 200

    except Exception as e:
        return jsonify(error=str(e)), 500

if __name__ == '__main__':
    app.run(port=3000)  # Run the server on port 3000