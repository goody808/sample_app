require 'spec_helper'


describe "UserPages" do
  
subject { page }


describe "Sign Up Page" do
  before { visit signup_path }

	let(:submit) {"Create my account"}
 
  it { should have_selector('h1',    text: "Sign Up") }
  it { should have_selector('title', text: full_title("Sign Up")) }

	describe "invalid sign up content" do
	  it "should not add a user to the db" do 	
	  	expect {click_button submit}.not_to  change(User, :count) 
	  end
	end 

	describe "valid signup" do 
		before do
			fill_in "Name", 								 with: "Example User"
			fill_in "Email", 								 with: "example@user.com"
			fill_in "Password", 						 with: "foobar"
			fill_in "Password Confirmation", with: "foobar"
		end
		
		it "should save a user and change the db by 1" do 
			expect {click_button submit}.to change(User, :count).by(1)
		end
	end

	# describe "invalid email address" do 
	# 	before do 
	# 		fill_in "Name", 								 with: "Example User"
	# 		fill_in "Email", 								 with: "exampleuser.com"
	# 		fill_in "Password", 						 with: "foobar"
	# 		fill_in "Password Confirmation", with: "foobar"
	# 	end
		
	# 	it "should have error message on page 'Email is Invalid" do
	# 	click_button submit page.should have_content(text: "Email is invalid")
	# 	end
	# end
end 
  
describe "profile page" do
 	let(:user) { FactoryGirl.create(:user) }
  before { visit user_path(user) }

	  it { should have_selector('h1',    text: user.name) }
	  # it { should have_selector('title', text: user.name) }
	end
end