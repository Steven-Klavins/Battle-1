require "spec_helper"

feature "Entering players" do
  scenario "player enters name in form and sees on screen" do
    visit ('/')
    fill_in :player_1_name, with: "Bob"
    fill_in :player_2_name, with: "Anna"
    click_button 'Submit'
    expect(page).to have_content "Bob vs Anna"
  end
end