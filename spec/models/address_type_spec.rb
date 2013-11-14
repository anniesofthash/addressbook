require 'spec_helper'

  describe "Address Type" do
    it "should be able to return its type" do
      assert_equal(FactoryGirl.build(:individual).get_type, :individual)
      assert_equal(FactoryGirl.build(:family).get_type, :family)
      assert_equal(FactoryGirl.build(:married_couple).get_type, :married_couple)
      assert_equal(FactoryGirl.build(:unmarried_couple).get_type, :unmarried_couple)
      assert_equal(FactoryGirl.build(:single_parent).get_type, :single_parent)
    end

    it "should easily return the type for an individual" do
      assert_equal(FactoryGirl.create(:individual).description, AddressType.individual.description)
    end

    it "should easily return the type for a family" do
      assert_equal(FactoryGirl.create(:family).description, AddressType.family.description)
    end

    it "should be able to determine if an address type only should have one main contact" do
      assert(FactoryGirl.build(:individual).only_one_main_contact?)
      assert(FactoryGirl.build(:single_parent).only_one_main_contact?)

      assert(!FactoryGirl.build(:family).only_one_main_contact?)
      assert(!FactoryGirl.build(:married_couple).only_one_main_contact?)
      assert(!FactoryGirl.build(:unmarried_couple).only_one_main_contact?)
    end

    it "should be able to determine the address types for an address with one contact" do
      contact = FactoryGirl.build(:john_doe)
      contact.assign_address(FactoryGirl.build(:chicago))
      contact.save

      address_types = AddressType.valid_address_types_for_address(FactoryGirl.build(:chicago)).map(&:get_type)
      assert address_types.include?(:individual)
      assert address_types.include?(:single_parent)
    end

    it "should be able to determine the address types for an address with multiple contacts" do
      contact = FactoryGirl.build(:john_doe)
      contact.assign_address(FactoryGirl.build(:chicago))
      contact.save

      contact = FactoryGirl.build(:jane_doe)
      contact.assign_address(FactoryGirl.build(:chicago))
      contact.save

      address_types = AddressType.valid_address_types_for_address(FactoryGirl.build(:chicago))
      assert_equal AddressType.all, address_types
    end
  end
