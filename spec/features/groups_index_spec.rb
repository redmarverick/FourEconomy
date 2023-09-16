require 'rails_helper'
require 'spec_helper'

RSpec.feature 'GroupsIndex', type: :feature do
  context 'groups_index' do
    let(:user) do
      User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    end

    it 'allows a user to sign in and create category', js: true do
      visit root_path
      click_link 'LOG IN'
      visit users_sign_in_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
      expect(page).to have_content('categories')

      find('#new-group').click

      expect(page).to have_content('CREATE CATEGORY')

      visit current_url

      fill_in 'group[name]', with: 'Example Category'
      fill_in 'group[icon]', with: 'https://cdn-icons-png.flaticon.com/512/53/53283.png'

      find('#submitFormButton').click

      expect(page).to have_content('Example Category') # Replace with the expected category name
    end

    it 'allows a user to sign in and create transaction', js: true do
      visit root_path
      click_link 'LOG IN'
      visit users_sign_in_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
      expect(page).to have_content('categories')
      find('#new-group').click
      expect(page).to have_content('CREATE CATEGORY')
      visit current_url
      fill_in 'group[name]', with: 'Example Category'
      fill_in 'group[icon]', with: 'https://cdn-icons-png.flaticon.com/512/53/53283.png'
      find('#submitFormButton').click
      expect(page).to have_content('Example Category')

      click_link 'Example Category'
      expect(page).to have_content('No entities for this group.')

      find('#new-entity').click
      expect(page).to have_content('CREATE TRANSACTION')

      visit current_url

      fill_in 'entity[name]', with: 'Example transaction'
      fill_in 'entity[amount]', with: '100'
      check('Example Category')

      find('#submitFormButton').click

      expect(page).to have_content('Example transaction')
      expect(page).to have_content('100')
    end
  end
end
