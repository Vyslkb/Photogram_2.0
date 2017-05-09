require 'rails_helper'
require 'spec_helper'

feature 'Can view individual posts' do
  background do
    user = create(:user)
    @post = create(:post, user_id: 1)

    sign_in_with user
  end
  scenario 'Can click and view a single post' do
    visit '/'
    find(:xpath, "/html/body/div/div/div/div/div[2]/a").click
    expect(page.current_path).to eq(post_path(@post))
  end
end
