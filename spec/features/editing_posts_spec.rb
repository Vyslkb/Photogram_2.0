require 'rails_helper'

feature 'Editing posts' do
  background do
    # create a post with factory_girl
    post = create(:post)
    # visit the root route

    visit '/'
    # click the image of the post we created with factory_girl
    find(:xpath, "html/body/a[2]").click
    # click the 'edit post' link
    click_link 'Edit Post'
  end

  scenario 'Visit root, click on image, click to link edit post, change caption and click to update post' do
    # fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
    fill_in 'Caption', with: "Oh god, you weren’t meant to see this picture!"
    # click the ’Update Post’ button
    click_button 'Update Post'

    # expect the page to have content saying "Post updated hombre."
    expect(page).to have_content("Post updated hombre.")
    # expect the page to have content saying “Oh god, you weren’t meant to see this picture!”
    expect(page).to have_content("Oh god, you weren’t meant to see this picture!")
  end

    it "won't update a post without an image" do
      attach_file('Image', 'spec/files/images/error.txt')
      click_button 'Update Post'

      expect(page).to have_content("Something is wrong with your form!")
    end


end
