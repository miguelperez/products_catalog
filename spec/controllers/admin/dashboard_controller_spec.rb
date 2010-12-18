require 'spec_helper'

describe Admin::DashboardController do

  it { {:get => 'admin'}.should route_to(:controller => 'admin/dashboard', :action => 'index') }
  
end
