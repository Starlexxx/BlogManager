  require "application_system_test_case"

  class TimeEntriesIntegrationTest < ApplicationSystemTestCase
    test "visiting the index" do
      visit root_url

      find('#user_email').fill_in with: users(:admin).email
      find('#user_password').fill_in with: 'asdf'

      find('input[type="submit"]').click

      assert_text 'Category'

      click_on 'Create Blog'
      fill_in 'Title', with: 'qwety'

      find('input[type="submit"]').click
      assert_text 'Category: Pascal'

      click_on 'Delete'
      assert_text 'Category'
      click_on 'Create Blog'
      fill_in 'Title', with: 'qwety'

      find('input[type="submit"]').click
      assert_text 'Category: Pascal'

      click_on 'Delete'
      assert_text 'Category'

      click_on 'Create Category'
      fill_in 'Category', with: 'qwety'

      find('input[type="submit"]').click
      assert_text 'Category was successfully created.'

      click_on 'Back'
      click_on 'Main Page'

      assert_text 'Category'
    end
  end