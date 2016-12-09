class Product < ApplicationRecord

  validates_presence_of :name, :price, :stock_qty

  def to_param
    self.friendly_id
  end

end
