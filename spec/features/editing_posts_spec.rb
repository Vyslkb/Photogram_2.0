require 'rails_helper'

feature 'Editing posts' do
  background do
    user = create(:user)
    user_2 = create(:user,  email: 'yanina@mail.ru',
                                        user_name: 'yanieegerton',
                                        password: 'supersecret',
                                        id: user.id + 1)

    post = create(:post, user_id: user.id, id: 1)
    post_2 = create(:post, user_id: user.id + 1, id: 2)

    sign_in_with user

    visit '/'
  end

  scenario 'can edit a post as the owner' do
    find(:xpath, "/html/body/div/div/div[2]/div/div[2]/a").click
    expect(page).to have_content("Edit Post")

    click_link "Edit Post"
    fill_in "Caption", with: "Hello, zagpro"
    click_button "Update Post"

    expect(page).to have_content('Post updated hombre')
    expect(page).to have_content("Hello, zagpro")
  end

  scenario "cannot edit a post that doesn't belong to you via the show page" do
    find(:xpath, "/html/body/div/div/div[1]/div/div[2]/a").click
    expect(page).to_not have_content("Edit Post")
  end

  scenario "cannot edit a post that doesn't belong to you via url path" do
    visit '/posts/2/edit'
    expect(page.current_path).to eq root_path
    expect(page).to have_content("That post doesn't belong to you!")
  end

  scenario "a post won't update without an attached image" do
    find(:xpath, "/html/body/div/div/div[2]/div/div[2]/a").click
    click_link "Edit Post"
    attach_file('Image', 'spec/files/images/error.txt')
    click_button "Update Post"

    expect(page).to have_content("Something is wrong with your form!")
  end
end
