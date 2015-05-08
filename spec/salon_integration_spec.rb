require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('prevention of adding clients without stylist', {:type => :feature}) do
  it('will not add clients until there is a stylist to add them to') do
    visit('/')
    click_link('Add New Client')
    expect(page).to have_content("There are currently no stylists")
  end
end

describe('add stylist path', {:type => :feature}) do
  it('will successfully add a new stylist') do
    visit('/')
    click_link('Add New Stylist')
    fill_in("name", :with => "test stylist")
    click_button("Add Stylist")
    expect(page).to have_content("test stylist")
  end
end

describe('add client to stylist path', {:type => :feature}) do
  it('will successfully add a new client to stylist') do
    visit('/')
    click_link('Add New Stylist')
    fill_in("name", :with => "test stylist")
    click_button("Add Stylist")
    click_link('test stylist')
    click_button("Add Client")
    fill_in("name", :with => "test client")
    select('test stylist', :from => "stylist_id")
    click_button("Add Client")
    expect(page).to have_content("test client")
  end
end
