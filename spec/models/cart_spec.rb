require 'rails_helper'

RSpec.describe Cart, type: :model do

  before do
    @product1 = Product.create!( :name => "Foo", :price => 100, :stock_qty => 1)
    @product2 = Product.create!( :name => "Bar", :price => 10, :stock_qty => 1)
    @cart = Cart.create
  end

  describe "#amount" do
    it "should return total amount" do
      @cart.line_items.create( :product_id => @product1.id, :qty => 1, :price => @product1.price)
      @cart.line_items.create( :product_id => @product2.id, :qty => 2, :price => @product2.price)

      expect(@cart.amount).to eq(120)
    end
  end


end
