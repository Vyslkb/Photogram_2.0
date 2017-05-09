require 'rails_helper'

feature 'Delete Post' do
  background do
    user = create(:user)
    post = create(:post, user_id: 1)

    sign_in_with user

    find(:xpath, "/html/body/div/div[2]/div/div/div[2]/a").click
    click_link 'Edit Post'
  end

  scenario 'Expect deleted post' do
    click_link 'Delete Post'

    expect(page).to have_content('Problem solved!  Post deleted.')
    expect(page).to_not have_content('Abs for days.')
  end
end
