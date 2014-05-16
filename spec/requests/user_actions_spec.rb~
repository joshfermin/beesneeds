require "spec_helper"

describe "user registration" do
  it "allows new users to register for the site" do
    visit "/users/sign_up"

    fill_in "user_name",                    :with => "Mister Smith"
    fill_in "user_email",                   :with => "example@example.com"
    fill_in "user_password",                :with => "password"
    fill_in "user_password_confirmation",   :with => "password"

    click_button "Sign up"
     

    page.should have_content("Welcome to The Bees Needs!")
    
  end
end

describe "user sign in" do 
  it "allows a registered user to sign in" do
    user = User.create(     :email => "example@example.com",
                            :password => "password")
    
    visit "/users/sign_in"

    fill_in "user_email",              :with => "example@example.com"
    fill_in "user_password",           :with => "password"

    click_button "Sign in"



    page.should have_content("Once you've registered your block,")

  end
end


    



