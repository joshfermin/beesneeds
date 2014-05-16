require 'spec_helper'

describe "User tries to create report without block" do
  it "Won't let a user create a report without a registered block" do

     user = User.create(     :email => "test@test.com",
                             :password => "password")
    
    visit "/users/sign_in"

    fill_in "user_email",              :with => "test@test.com"
    fill_in "user_password",           :with => "password"

    click_button "Sign in"

    visit "/reports/new"

    page.should have_content("Please register a block first.")


  end	

end

describe "User successfully creates report" do
  it "will let a user create a report once they have a block" do

    user = User.create(     :email => "e@e.com",
                            :password => "password")

    visit "/users/sign_in"
    
    fill_in "user_email",              :with => "e@e.com"
    fill_in "user_password",           :with => "password"

    click_button "Sign in"
    


    visit "/blocks"

    visit "/blocks/new"
    fill_in "block_block_number",      :with => "141002"

    click_button "Create Block"

    visit "/reports/new"
    
    click_button "Continue"
    click_button "Continue"
    page.should have_content("Report saved")

  end
end

describe "User successfully creates and edits report" do
  it "will let a user create a report and then edit it" do

    user = User.create(     :email => "e@e.com",
                            :password => "password")

    visit "/users/sign_in"
    
    fill_in "user_email",              :with => "e@e.com"
    fill_in "user_password",           :with => "password"

    click_button "Sign in"
    


    visit "/blocks"

    visit "/blocks/new"
    fill_in "block_block_number",      :with => "141002"

    click_button "Create Block"

    visit "/reports/new"
    
    click_button "Continue"
    click_button "Continue"

    visit "/reports/1/edit"
    click_button "Continue"
    page.should have_content("Report was successfully updated.")

  end
end



