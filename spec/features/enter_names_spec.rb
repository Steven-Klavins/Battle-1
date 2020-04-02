require "spec_helper"

feature "Entering players" do
  scenario "player enters name in form and sees on screen" do
    sign_in_and_play
    expect(page).to have_content "Bob vs Anna"
  end
end

feature "View Hitpoints" do
  scenario "As player I need to see my components HP" do
    sign_in_and_play
  expect(page).to have_content "Player 2 HP: 100"
  end
end