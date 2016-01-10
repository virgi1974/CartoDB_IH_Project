require './test/test_helper'
require 'rails_helper'
require 'spec_helper'

class UserTest < ActiveSupport::TestCase

  RSpec.describe User, type: :model do   

    describe "validation of the user-name" do
      describe "failed user creation" do
        it "fails if name is not filled" do
           expect(User.create(
          :name => '',
          :email => 'mail_admin@test.com',
          :password => 'password_admin',
          :password_confirmation => 'password_admin')).to_not be_valid
        end
        it "fails if email is not filled" do
           expect(User.create(
          :name => 'sasasaa',
          :email => '',
          :password => 'password_admin',
          :password_confirmation => 'password_admin')).to_not be_valid
        end
        it "fails if password is not filled" do
           expect(User.create(
          :name => 'sasasaa',
          :email => 'mail_admin@test.com',
          :password => '',
          :password_confirmation => 'password_admin')).to_not be_valid
        end
        it "fails if password-confirmation is not filled" do
            expect(User.create(
          :name => 'sasasaa',
          :email => 'mail_admin@test.com',
          :password => 'password',
          :password_confirmation => '')).to_not be_valid
        end
      end
      describe "successful user creation" do
        # it "passes if all fields are given" do
        #   expect(User.create(
        #   :name => 'virgi',
        #   :email => 'mail_admin@test.com',
        #   :password => 'password_admin',
        #   :password_confirmation => 'password_admin')).to be_valid
        # end
      end
    end

  describe "user relations" do
    it "should have many maps" do
      @user = User.reflect_on_association(:maps)
      @user.macro.should == :has_many
    end

    it "should have many comments" do
      @user = User.reflect_on_association(:comments)
      @user.macro.should == :has_many
    end
  end
    
  end

end


