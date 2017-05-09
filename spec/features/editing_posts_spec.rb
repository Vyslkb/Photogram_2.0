require 'rails_helper'

feature 'Editing posts' do
  background do
    user = create(:user)
    post = create(:post, user_id: 1)

    sign_in_with user

    visit '/'
    find(:xpath, "/html/body/div/div/div/div/div[2]/a").click
    click_link 'Edit Post'
  end

  scenario 'Visit root, click on image, click to link edit post, change caption and click to update post' do
    fill_in 'Caption', with: "Oh god, you weren’t meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre.")
    expect(page).to have_content("Oh god, you weren’t meant to see this picture!")
  end

    it "won't update a post without an image" do
      attach_file('Image', 'spec/files/images/error.txt')
      click_button 'Update Post'

      expect(page).to have_content("Something is wrong with your form!")
    end


end
