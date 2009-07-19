require File.dirname(__FILE__) + '/../spec_helper'

describe Redirect do
  before(:each) do
    @redirect = Redirect.new
  end

  it "should be valid" do
    @redirect.should be_valid
  end
end
