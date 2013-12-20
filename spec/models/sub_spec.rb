require 'spec_helper'

describe Sub do

  it {should have_many(:links)}
  it {should belong_to(:moderator).class_name('User')}

  context "Mass Assign" do
    it "should fail mass assign without moderator_id" do
      expect(FactoryGirl.build(:sub, :moderator_id => nil)).not_to be_valid
    end

    it "should fail mass assign without sub name" do
      expect(FactoryGirl.build(:sub, :name => nil)).not_to be_valid
    end

    it "should pass moderator_id and name" do
      expect(FactoryGirl.build(:sub)).to be_valid
    end



  end

end
