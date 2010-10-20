class CategoriesController < ApplicationController
  layout "site"
  def show
    @category = Category.find(params[:id],:include => :children)
  end
end
