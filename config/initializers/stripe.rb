Rails.configuration.stripe = {
  :publishable_key => 'pk_test_wvOyE1z0g2uox7TkKdPla6w0',
  :secret_key => 'sk_test_QO3KseslV3h1QBR4UUCZUK8O'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]