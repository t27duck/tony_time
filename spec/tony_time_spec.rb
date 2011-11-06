require 'spec_helper'

def setup_now(year, month, day, hour, minute = 0, second = 0)
  @tony_time.stub!(:now).and_return(DateTime.new(year, month, day, hour, minute, second))
end

describe TonyTime do
  before(:each) do
    @tony_time = TonyTime.new
  end
  describe '#today_tony_time' do
    it 'should return 11/3/2011 4:00PM' do
      setup_now(2011, 11, 3, 11, 30)
      @tony_time.send(:today_tony_time).should == DateTime.new(2011, 11, 3, 16)
    end

    it 'should return 11/4/2011 4:00PM' do
      setup_now(2011, 11, 4, 19, 23)
      @tony_time.send(:today_tony_time).should == DateTime.new(2011, 11, 4, 16)
    end
  end

  describe '#next_tony_time' do
    it 'should return 11/3/2011 4:00PM (Thursday) if #now is 11/3/2011 2:00PM (Thursday)' do
      setup_now(2011, 11, 3, 14)
      @tony_time.next_tony_time.should == DateTime.new(2011, 11, 3, 16)
    end

    it 'should return 11/3/2011 4:00PM (Thursday) if #now is 11/2/2011 5:00PM (Wednesday)' do
      setup_now(2011, 11, 2, 17)
      @tony_time.next_tony_time.should == DateTime.new(2011, 11, 3, 16)
    end

    it 'should return 11/7/2011 4:00PM (Monday) if #now is 11/4/2011 5:00PM (Friday)' do
      setup_now(2011, 11, 4, 17)
      @tony_time.next_tony_time.should == DateTime.new(2011, 11, 7, 16)
    end

    it 'should return 11/7/2011 4:00PM (Monday) if #now is 11/5/2011 5:00PM (Saturday)' do
      setup_now(2011, 11, 5, 17)
      @tony_time.next_tony_time.should == DateTime.new(2011, 11, 7, 16)
    end
  end

  describe '#during_tony_time?' do
    it "should return true if it's 0-5 minutes after Tony Time" do
      (0..5).each do |minute|
        setup_now(2011, 11, 3, 16, minute)
        @tony_time.during_tony_time?.should be_true
      end
    end

    it "should return false if it's not 0-5 minutes after Tony Time" do
      (6..59).each do |minute|
        setup_now(2011, 11, 3, 16, minute)
        @tony_time.during_tony_time?.should be_false
      end
    end

    it "should return false if it's 0-5 minutes after Tony Time on the weekend" do
      (0..5).each do |minute|
        setup_now(2011, 11, 6, 16, minute)
        @tony_time.during_tony_time?.should be_false
      end
    end
  end
end
