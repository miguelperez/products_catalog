require 'spec_helper'

describe ArrayExtentions do
  context "when included" do
    before(:each) do
      @module_tester = Object.new.extend(ArrayExtentions)
      @array = [1]
    end
    
    it "should return an ul when calling to_ul with an array" do
      @module_tester.to_ul(@array).should == "<ul><li>1</li></ul>"
      @module_tester.to_ul(@array, {:class => "class_name", :id => "id"}).should == "<ul class='class_name' id='id'><li>1</li></ul>"
    end
    
    #THIS TEST REALLY SUCKS
    it "should return an array of links when calling convert_to_links" do
      @module_tester.stub!(:tags_url)
      @module_tester.stub!(:link_to).and_return("link")
      @module_tester.convert_to_links(@array, :tags_url).should == ["link"]
    end
  end
end