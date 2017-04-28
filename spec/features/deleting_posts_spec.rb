require 'rails_helper'

feature 'Delete Post' do
  background do
    post = create(:post, caption: "It should be deleted")

    visit '/'
    find(:xpath, "html/body/a[2]").click
    click_link 'Edit Post'
  end

  scenario 'Expect deleted post' do
    click_link 'Delete Post'

    expect(page).to have_content("Problem solved!  Post deleted.")
    expect(page).to_not have_content("It should be deleted")
  end
end
