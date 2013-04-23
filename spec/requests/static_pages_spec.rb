require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Contact Us" do 
		before  { visit contact_path}
		
		it { should have_selector('h1',    text: 'Contact Us') }
		it { should have_selector('title', text: full_title("Contact Us")) }
	end

	describe "Home page" do
		before  { visit root_path }

		it { should have_selector('h1',        text: 'Sample App') }
		it { should have_selector('title',     text: full_title('')) }
		it { should_not have_selector('title', text: full_title('Home')) }
	end

	describe "Help page test" do 
		before  { visit help_path }
		
		it { should have_selector('h1',    text: 'Help') }
		it { should have_selector('title', text: full_title('Help')) }
	end
	
	describe "About page test" do 
		before  { visit about_path } 
	
		it { should have_selector('h1',    text: 'About Us') }
		it { should have_selector('title', text: full_title("About Us")) }
	end

	it "should have the right linkes to the layout" do 
		visit root_path
		click_link "About"
		should have_selector('title', text: full_title('About Us'))
		click_link "Help"
		should have_selector('title', text: full_title('Help'))
		click_link "Contact"
		should have_selector('title', text: full_title('Contact'))		
		click_link "Home"
		click_link "Sign up now!"
		should have_selector('title', text: full_title('Sign Up'))
		click_link "sample app"
		should have_selector('title', text: full_title(''))
	end
end


