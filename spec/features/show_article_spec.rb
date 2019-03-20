require "rails_helper"

RSpec.describe "Showing an article" do
  
  before do
    @article = Article.create(title: "The first article!", body: "test article 1!")
  end
  
  it "Shows an article for a user" do
    
    visit "/"
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end

