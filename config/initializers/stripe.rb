Rails.configuration.stripe = {
  # # Test Publishable Key
  # :publishable_key  => "pk_test_HcSwePPb7G8zqlOpz3AkO45i",
  # # Test Secret Key
  # :secret_key       => "sk_test_YnHT747erU01qdVW0pjpsPyB"
  
  
  # Live Publishable Key
  :publishable_key  => ENV['STRIPE_PUBLISHABLE_KEY'],
  # Live Secret Key
  :secret_key       => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]