require 'spec_helper'

describe "Create block" do
  it "allows a user to create a block after signing in" do
    user = User.create(     :email => "e@e.com",
                            :password => "password")
        
    visit "/users/sign_in"

    fill_in "user_email",              :with => "e@e.com"
    fill_in "user_password",           :with => "password"

    click_button "Sign in"

    visit "/blocks/new"

    fill_in "block_block_number",      :with => "141000"

    click_button "Create Block"

    page.should have_content("Block was successfully created.")
    
    end
end

describe "Create duplicate block" do
  it "will not allow the same block to be created twice" do

    user = User.create(     :email => "e@e.com",
                            :password => "password")

    visit "/users/sign_in"
    
    fill_in "user_email",              :with => "e@e.com"
    fill_in "user_password",           :with => "password"

    click_button "Sign in"
    


    visit "/blocks"

    visit "/blocks/new"
    fill_in "block_block_number",      :with => "141001"

    click_button "Create Block"

    visit "/blocks/new"
    fill_in "block_block_number",      :with => "141001"

    click_button "Create Block"
    
    page.should have_content("Block number has already been taken")

  end  
end


    
