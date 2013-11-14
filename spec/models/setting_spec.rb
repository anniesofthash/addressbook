require 'spec_helper'

  describe "Settings" do
    it "should be able to set the application's username" do
      Settings.username = "bob"
      assert_equal "bob", Settings.username
    end

    it "should be able to set the application's password" do
      Settings.password = "mypass"
      assert_equal Password.encode("mypass"), Settings.password
    end

    it "should not be able to save an invalid address" do
      assert !Settings.save_home_address(Address.new(:address1 => "123 South Ave", :city => "Chicago", :state => "IL"))
    end

    it "should be able to get the home address as an address object" do
      Settings.save_home_address(Address.new(:address1 => "123 South Ave", :city => "Chicago", :state => "IL", :zip => "60606"))
      address = Settings.home_address
      assert_equal Address, address.class
      assert_equal "123 South Ave", address.address1
      assert_equal "Chicago", address.city
      assert_equal "IL", address.state
      assert_equal "60606", address.zip
    end

    describe "when working with login credentials" do
      setup do
        Settings.username = 'bobby'
        Settings.password = 'pass'
      end

      it "should be able to update the login credentials" do
        msg = Settings.update_login_credentials('bob', 'newpass', 'newpass', 'pass')
        assert_nil msg
        assert_equal 'bob', Settings.username
        assert_equal Password.encode('newpass'), Settings.password
      end
    end
  end
