require 'spec_helper'

describe SubscribersController do

  context "on GET to #new" do
    it "should assign the subscribers variable" do
      get :new
      assigns(:subscriber).should_not be_nil
    end
  end
  
  context "on POST to #create" do
    it "should create a subscriber if valid params are passed" do
      Subscriber.destroy_all
      lambda do
        post :create, :subscriber => Factory.attributes_for(:subscriber)
      end.should change(Subscriber, :count).by(1)
      response.should redirect_to(root_url)
    end
    it "should not create a subscriber if incorrect params are passed" do
      lambda do
        post :create, :subscriber => Factory.attributes_for(:subscriber, :name => "")
      end.should_not change(Subscriber, :count)
      response.should redirect_to(root_url)
    end
  end
  
  context "on DELTE to #destroy" do
    it "should delete the referenced subscriber" do
      subscriber = Factory(:subscriber)
      lambda do
        delete :destroy, :id => subscriber.id
      end.should change(Subscriber, :count).by(-1)
    end
  end
  
end
