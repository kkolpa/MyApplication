class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card

    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100), # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
        UserMailer.order_confirmation_email(@user,@product).deliver_now
        flash[:success] = "You have successfully paid for your order! Check out your email for the order confirmation!"
      end

    rescue Stripe::CardError => e
      # The card has been declined
     body = e.json_body
     err = body[:error]
     flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
   end
   redirect_to product_path(@product), notice: "Thank you for your order!"
 end

end
