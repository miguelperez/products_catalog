require 'spec_helper'

describe Admin::SubscribersController do
  it { {:get    => 'admin/subscribers'}.should route_to(:controller => 'admin/subscribers', :action => 'index') }
  it { {:delete => 'admin/subscribers/1'}.should route_to(:controller => 'admin/subscribers', :action => 'destroy', :id => "1") }
  it { {:get    => 'admin/subscribers/new'}.should route_to(:controller => 'admin/subscribers', :action => 'new') }
  
  context "on GET to #new" do
    before(:each) do
      login
    end
    it "should assign the subscribers variable" do
      get :new
      assigns(:subscriber).should_not be_nil
    end
  end
  
  context "on POST to #create" do
    before(:each) do
      login
    end
    it "should create a subscriber if valid params are passed" do
      Subscriber.destroy_all
      lambda do
        post :create, :subscriber => Factory.attributes_for(:subscriber)
      end.should change(Subscriber, :count).by(1)
      response.should redirect_to(admin_subscribers_url)
    end
    it "should not create a subscriber if incorrect params are passed" do
      lambda do
        post :create, :subscriber => Factory.attributes_for(:subscriber, :name => "")
      end.should_not change(Subscriber, :count)
      response.should_not redirect_to(admin_subscribers_url)
      response.should render_template('new')
    end
  end
  
  context "on DELTE to #destroy" do
    before(:each) do
      login
    end
    it "should delete the referenced subscriber" do
      subscriber = Factory(:subscriber)
      lambda do
        delete :destroy, :id => subscriber.id
      end.should change(Subscriber, :count).by(-1)
    end
  end
  
  def login
    @user = Factory(:user)
    login_a_user(@user)
  end
  
  
end
