class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id],:include => :children)
  end
end
