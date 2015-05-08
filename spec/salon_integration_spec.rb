require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new client', {:type => :feature}) do
  it('allows a user to add a new client to the database using a form') do
    visit('/')
    click_link('Add New Client')
    fill_in('name', :with => 'Scary Spice')
    click_button('Add Client')
    #fill_in('stylist_id', :with => nil)
    expect(page).to have_content('Scary Spice')
  end
end
