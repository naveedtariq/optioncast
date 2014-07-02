require 'spec_helper'

feature "Home Page" do
  background {visit static_pages_home_path}
  
  
  scenario "should have a title" do
    expect(page).to have_title("OptionCast")
    expect(page).not_to have_title('- Home')
  end
  
  scenario "should have a nav brand" do
    expect(page.has_css?('div class', text: "navbar-header"))
  end
  
  scenario "should have a nav bar" do
    expect(page.has_css?('div class', text: "nav navbar-right"))
  end
  
  scenario "nav bar should have links" do
    expect(page).to have_link('Data', href: "#")
    expect(page).to have_link('Option Radar', href: "#")
    expect(page).to have_link('Features', href: "#")
    expect(page).to have_link('Sign Up', href: "#")
    expect(page).to have_link('Login', href: "#")
  end
end
