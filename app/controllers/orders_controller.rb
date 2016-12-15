class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find( params[:id] )
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new( order_params )
    @order.add_products_by_cart(current_cart)
    @order.user = current_user

    if @order.save
      current_cart.destroy
      session[:cart_id] = nil

      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def checkout_pay2go
    @order = current_user.orders.find( params[:id] )

    if @order.paid?
      redirect_to :back, alert: 'already paid!'
    else
      @payment = Payment.create!( :order => @order,
                                  :payment_method => params[:payment_method],
                                  :amount => @order.amount )
      render :layout => false
    end

  end

  protected

  def order_params
    params.require(:order).permit(:receiver_name, :email, :cellphone, :address)
  end
end
