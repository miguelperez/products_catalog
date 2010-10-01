require 'spec_helper'

describe Admin::UserSessionsController do

  it { {:get => "login"}.should route_to(:controller => "admin/user_sessions", :action => "new") }
  it { {:post => "admin/user_sessions"}.should route_to(:controller => "admin/user_sessions", :action => "create") }
  
  context "on GET to #login" do
    it "should render new" do
      get :new
      response.should render_template('new')
    end
  end
  
  context "on POST to #create" do
    it "should create user session" do
      Factory(:user, :password => 'password', :email => '1@email.com', :password_confirmation => 'password')
      post :create, :user_session => { :email => "1@email.com", :password => "password" }
      user_session = UserSession.find
      user_session.should_not be_nil
      response.should redirect_to('/')
    end
    it "should not create user session for invalid password" do
      Factory(:user, :password => 'password', :email => '1@email.com', :password_confirmation => 'password')
      post :create, :user_session => { :email => "1@s.com", :password => "pssss" }
      user_session = UserSession.find
      user_session.should be_nil
      response.should be_success
      response.should render_template('new')
    end
  end
  
end
