require 'spec_helper'

  describe "Group" do
    it "should be able to find all groups for listing in the app" do
      groups = Group.find_for_list
      assert_equal(0, groups.size)
    end

    it "should be able to create mailing lables for group members" do
      group = FactoryGirl.build(:group_1)
      group.addresses << [FactoryGirl.build(:chicago), FactoryGirl.build(:tinley_park), FactoryGirl.build(:alsip)]
      group.save

      labels = group.create_labels('Avery8660')
      assert_not_nil labels
    end

    it "should be able to find all addresses eligible for group membership, but not in the group" do
      group = FactoryGirl.build(:group_1)
      group.addresses = [FactoryGirl.create(:alsip)]
      group.save

      not_included = group.addresses_not_included
      assert_equal 0, not_included.size
    end

    it "should be able to find all addresses eligible for group membership for a group with no current members" do
      group = FactoryGirl.create(:group_1)

      not_included = group.addresses_not_included
      assert_equal 0, not_included.size
    end
  end
