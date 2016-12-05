class CartsController < ApplicationController

  def add_product
    @product = Product.find( params[:product_id] )

    current_cart.add_product(@product)

    flash[:notice] = "加入購物車"
    redirect_to :back
  end

  def remove_product
    @product = Product.find( params[:product_id] )

    current_cart.remove_product(@product)

    redirect_to :back
  end

end
