require 'spec_helper'

describe Admin::DashboardController do

  it { {:get => 'admin/dashboard'}.should route_to(:controller => 'admin/dashboard', :action => 'index') }

end
