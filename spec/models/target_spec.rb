require File.dirname(__FILE__) + '/../spec_helper'

describe Target do
  before(:each) do
    @target = Target.new
  end

  it "should be valid" do
    @target.should be_valid
  end
end
