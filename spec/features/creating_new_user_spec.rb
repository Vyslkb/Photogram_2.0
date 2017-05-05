require 'rails_helper'

feature 'Creating a new user' do
  background do
    # Visit the home page
    visit '/'
    # Click the 'Register' link
    click_link 'Register'
  end

  scenario 'Can create a new user via index page' do
    # Fill in the 'User name' field with 'zagpro'
    fill_in 'User name', with: 'zagpro'
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'zagorsky28@gmail.com'
    # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'Voodoo1408', match: :first
    # Fill in the 'Password confirmation' field with 'supersecret'
    fill_in 'Password confirmation', with: 'Voodoo1408'

    # Click the 'Sign up' button
    click_button 'Sign up'
    # Expect the page to have the message 'Welcome! You have signed up successfully.'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'zagorsky28@gmail.com'
    # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'Voodoo1408', match: :first
    # Fill in the 'Password confirmation' field with 'supersecret'
    fill_in 'Password confirmation', with: 'Voodoo1408'

    # Click the 'Sign up' button
    click_button 'Sign up'
    # Expect the page to have the message 'You need a user name to create an account.'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be more than 4 characters' do
    # Fill in the 'User name' field with 'h'
    fill_in 'User name', with: 'z'
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'zagorsky28@gmail.com'
    # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'Voodoo1408', match: :first
    # Fill in the 'Password confirmation' field with 'supersecret'
    fill_in 'Password confirmation', with: 'Voodoo1408'

    # Click the 'Sign up' button
    click_button 'Sign up'
    # Expect the page to have the message 'minimum is 4 characters'
    expect(page).to have_content("minimum is 4 characters")
  end

  scenario 'requires a user name to be less than 12 characters' do
    fill_in 'User name', with: 'h' * 17
    fill_in 'Email', with: 'zagorsky28@gmail.com'
    fill_in 'Password', with: 'Voodoo1408', match: :first
    fill_in 'Password confirmation', with: 'Voodoo1408'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 16 characters")
  end
end
