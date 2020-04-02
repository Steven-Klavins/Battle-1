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
    expect(page).to_not have_content 'Player 1 attacked!'

  end
end

feature 'Player 1 can click attack buttonm' do
  scenario 'after attacking, player sees confirmation of attack' do
    sign_in_and_play
    click_button('Attack!')
    expect(page).to have_content 'Player 1 attacked!'
  end
end

feature 'Player 1 attacks player 2 and hp goes down' do
  scenario 'after attacking p2 hp is 90' do
    sign_in_and_play
    click_button('Attack!')
    expect(page).to have_content 'Player 2 HP: 90'
  end
end