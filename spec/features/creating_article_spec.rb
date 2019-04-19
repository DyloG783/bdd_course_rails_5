require "rails_helper"

RSpec.feature "Creating Articles" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password") 
    login_as(@john)
  end
  
  scenario "A user creates a new article" do
    
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Test text"
    
    click_button "Create Article"
     
    expect(Article.last.user).to eq(@john)
    expect(page).to have_content("Article has been created")
    assert_current_path(articles_path) 
      # expect(page).to eq(articles_path) # method not working because it returns "~<capybara session>"
    expect(page).to have_content("Created by: #{@john.email}") # method not working because some pages cant render "article.user.email"
  end
  
  scenario "A user fails to create a new article" do
    
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    
    click_button "Create Article"
    
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end