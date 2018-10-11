class PaymentsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :reset_session

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user


    # Create the charge on Stripe's servers - this will charge the user's card

    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100), # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail],
        #receipt_email: params[:stripeEmail]
      )

      if charge.paid
        Order.create!(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
        #flash[:success] = "You have successfully paid for your order!"
        redirect_to payments_purchase_path
        UserMailer.order_confirmation_email(@user, @product).deliver_now
    end

    rescue Stripe::CardError => e
      # The card has been declined
     body = e.json_body
     err = body[:error]
     flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

   end
   #redirect_to product_path(@product), notice: "Thank you for your order! Check out your email for the order confirmation!"

 end

end
