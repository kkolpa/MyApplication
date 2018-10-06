class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.includes(:product).all
    else
      @orders = Order.includes(:product, :user).where(user_id: current_user.id).all
    #byebug
  end
end


  def show
    @order = Order.find(params[:id])
  end

  def create
  end

  def destroy
  end



end
