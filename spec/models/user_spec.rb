# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(name:"Example User", email: "example@user.com",
  													password: "foo", password_confirmation: "foo") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do 
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

	describe "when email is not present" do 
		before { @user.email = " " }
		it { should_not be_valid }
	end 

	describe "when email is too long" do 
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when user email is invalid" do 
		it "should be invalid" do 
			address = %w[josh,at.com jon@@foo.com jake@ 
								jill  jane@gon.. f$#!@/.jodh.josf]
			address.each do |invalid_address| 
				@user.email = invalid_address 
				@user.should_not be_valid
			end
		end
	end

	describe "when email is valid" do 
		it "valid email" do 
			address = %w[josh@asfs.org josh.G@me.com.edu johsh12321_3@me.edu  
				ARG+JF@me.com]
			address.each do |valid_email|
				@user.email = valid_email
				@user.should be_valid
			end
		end
	end

	describe "email is a duplicate" do 
		before do 
			user_same_email = @user.dup
			user_same_email.save
		end
		it { should_not be_valid }
	end
#Password test section 
	describe "password is blank" do 
		before { @user.password = @user.password_confirmation = " " } 
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do 
		before { @user.password_confirmation = "not_foo" }
		it { should_not be_valid }
	end

	describe "when password is nill" do 
		before { @user.password_confirmation = nill }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do 
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }

		describe "with valide password" do 
			it { should = found_user.authenticate(@user.password) }
		end 

		describe "with invalid password" do 
			let(:user_with_invalid_password) { found_user.authenticate("invalid") }

			it { should_not == user_with_invalid_password }
			specify { user_with_invalid_password.should be_false }
		end
	end

	describe "when password is too short" do 
		before { @user.password = @user.password_confirmation = 'a ' * 5 }
		it { should_not be_valid }
	end 
end
