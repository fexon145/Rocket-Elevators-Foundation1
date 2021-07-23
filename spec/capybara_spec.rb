require 'spec_helper'
require 'rails_helper'

describe "the Log in process", type: :feature do
    # before :each do
    #   User.make(email: 'user@example.com', password: 'password')
    # end
  
    it "Log me in" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'user_email', with: 'nicolas.genest@codeboxx.biz'
        fill_in 'user_password', with: '123456'
      end
      click_button 'commit'
      expect(page).to have_content 'Log in'
    end
  end
  