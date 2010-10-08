require 'spec_helper'

describe CategoriesController do

  it { {:get    => 'categories/1'}.should route_to(:controller => 'categories', :action => 'show', :id => "1") }
  
  context "on GET to #show" do
    it "should assign the category to the one referenced by its id" do
      category = Factory(:category)
      get :show, :id => category.id
      assigns(:category).should == category
    end
  end

end
