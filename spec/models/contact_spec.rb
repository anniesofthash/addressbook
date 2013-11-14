require 'spec_helper'

  describe "Contact" do
    it "should not be created with missing required info" do
      contact = Contact.new
      assert !contact.valid?
      assert contact.errors[:first_name].include?("can't be blank")
      assert contact.errors[:last_name].include?("can't be blank")
      assert contact.errors[:prefix].include?("can't be blank")
    end

    it "should null out the address when being destroyed" do
      contact = FactoryGirl.build(:john_doe)
      address = FactoryGirl.build(:chicago)
      contact.address = address
      contact.save
      assert_not_nil(contact.address)

      contact.destroy
      assert_nil(contact.address)
    end

    it "should not be able to be updated with an invalid phone number" do
      contact = FactoryGirl.build(:john_doe)
      contact.cell_phone = 'abcd'
      contact.work_phone = '972-2ou234=234'
      assert !contact.valid?
      assert contact.errors[:cell_phone].include?('is not valid')
      assert contact.errors[:work_phone].include?('is not valid')
    end

    it "should be able to find all contacts for listing in the app" do
      contacts = Contact.find_for_list
      assert_equal(0, contacts.size)
    end

    it "should scrub the phone numbers before saving them to the database" do
      contact = FactoryGirl.build(:john_doe)
      contact.work_phone = '312-555-1212'
      contact.cell_phone = '(312) 555.1213'
      contact.save!

      assert_equal '3125551212', contact.work_phone
      assert_equal '3125551213', contact.cell_phone
    end

    it "should first unlink the contact from an existing address before assigning a contact to a new address" do
      contact = FactoryGirl.build(:john_doe)
      contact.update_attribute(:address, FactoryGirl.build(:chicago))
      contact.assign_address(FactoryGirl.build(:alsip))
      contact.save!

      contact.reload
      assert_equal FactoryGirl.build(:alsip).address1, contact.address.address1
      assert_nil Address.find_by_id(FactoryGirl.build(:chicago))
    end
  end
