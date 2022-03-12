class Admin::DashboardController < ApplicationController
  def show
    @products = Product.count(:id)
    @categories = Category.count(:id) 
  end
end
