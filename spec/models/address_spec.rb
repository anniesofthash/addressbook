require 'spec_helper'

describe Address do
    it " should not be created without all required info" do
      address = Address.new
      assert !address.valid?
      assert address.errors[:base].include?('You must specify a phone number or a full address')
    end

     it "list the phone number as the addressee if there is no street address and no contacts" do
      address = FactoryGirl.build(:phone_only)
      assert_equal('708-111-3333', address.addressee)
    end

    it "list the phone number as the addressee for display if there is only a phone number" do
      address = FactoryGirl.build(:phone_only)
      assert_equal('708-111-3333', address.addressee_for_display)
    end

    it "should be considered equal when sorted when they have no primary contacts" do
      chicago = FactoryGirl.build(:chicago)
      alsip = FactoryGirl.build(:alsip)
      assert_equal(0, chicago.compare_by_primary_contact(alsip))
    end
 end

