require 'rails_helper'
require 'spec_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post)

    visit '/'
    find(:xpath, "/html/body/a[2]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
