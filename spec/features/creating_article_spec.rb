require "rails_helper"

RSpec.feature "Creating Articles" do
  
  scenario "A user creates a new article" do
    
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Test text"
    
    click_button "Create Article"
    
    expect(page).to have_content("Article has been created")
    assert_current_path(articles_path) 
    # expect(page).to eq(articles_path) # method not working because it returns "~<capybara session>"
  end
end