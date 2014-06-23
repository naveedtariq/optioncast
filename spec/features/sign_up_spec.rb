require 'spec_helper'

feature "Sign Up" do
  background {visit new_user_registration_path}
  given(:submit) {"Sign up"}
  
  scenario "with invalid information" do
    expect { click_button submit.not_to change(User, :count) }
  end
  
  scenario "with valid information" do  
    fill_in 'Username',               with: "Login Name"
    fill_in "Email",                  with: "tuser@example.com"
    fill_in "Password",               with: "foobar21"
    fill_in "Password confirmation",  with: "foobar21"
    expect {click_button submit}.to change(User, :count).by(1)
  end
end

feature "Edit Sign Up" do
  let(:user) { FactoryGirl.create(:user) }
  background do
    sign_in(user)    
    visit edit_user_registration_path
  end
  given(:submit) {"Update"}
  
  scenario  "with valid information" do  
    fill_in 'Username',               with: "Revised"
    fill_in "Email",                  with: "tuser2@example.com"
    fill_in "Password",               with: "foobar22"
    fill_in "Password confirmation",  with: "foobar22"  
    fill_in "Current password",       with: "foobar21"  
    click_button submit
    result = user.reload
    expect(result.username).to eq("revised")
    expect(result.email).to eq("tuser2@example.com")
  end
  
  scenario "with invalid information" do
    fill_in "Username",               with: ""
    fill_in "Email",                  with: ""
    fill_in "Password",               with: "foobar"
    fill_in "Password confirmation",  with: "foobar"  
    fill_in "Current password",       with: "foobar21"  
    click_button submit
    result = user.reload
    expect(result.username).to eq("login name")
    expect(result.email).to eq("euser@example.com")
  end
end