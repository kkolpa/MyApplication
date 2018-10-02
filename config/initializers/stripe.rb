if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_YaG9OdHprtv7qQZYUws4uCY8',
    secret_key: 'sk_test_lsOTlLF3dmt6LmPwKPEzLxd4'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
