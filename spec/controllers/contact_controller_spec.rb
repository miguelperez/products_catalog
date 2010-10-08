require 'spec_helper'

describe ContactController do
  it { {:get    => 'contact'}.should route_to(:controller => 'contact', :action => 'index') }
  it { {:post   => 'contact'}.should route_to(:controller => 'contact', :action => 'create') }

end
