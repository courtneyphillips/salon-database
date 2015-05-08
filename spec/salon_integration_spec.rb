require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('prevention of adding clients without stylist', {:type => :feature}) do
  it('will not add clients until there is a stylist to add them to') do
    visit('/')
    click_button('Add New Client')
    expect(page).to have_content('There are currently no stylists...')
  end
end
