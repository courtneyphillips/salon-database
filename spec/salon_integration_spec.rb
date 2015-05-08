require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new client', {:type => :feature}) do
  it('will not add clients until there is a stylist to add them to') do
    visit('/')
    click_link('Add New Client')
    expect(page).to have_content('There are currently no stylists')
  end
end
