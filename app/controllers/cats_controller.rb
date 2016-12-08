class CatsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json {
        @cats = Cat.all

        # Or use jbuilder
        render :json => @cats.map{ |x| { :id => x.id, :name => x.name, :image => x.image, :counter => x.counter } }.to_json
      }
    end
  end

end
