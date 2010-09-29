require 'spec_helper'

describe PagesController do

  it{ {:get => '/'}.should route_to(:controller => 'pages', :action => 'index') }

end
