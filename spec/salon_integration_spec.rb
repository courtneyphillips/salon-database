require('capybara/rspec')
require('spec_helper')
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

describe('new stylist, then add client to that stylist path', {:type => :feature}) do
  it('Will successfully add a new stylist and corresponding client') do
    visit('/')
    click_link('Add New Stylist')
    fill_in("name", :with => "test stylist")
    click_button("Add Stylist")
    click_link('test stylist')
    click_link("Add Client")
    fill_in("name", :with => "test client")
    select('test stylist', :from => "stylist_id")
    click_button("Add Client")
    expect(page).to have_content("test client")
  end
end

describe('delete stylist path', {:type => :feature}) do
  it('will successfully add a new client to stylist') do
    visit('/')
    click_link('Add New Stylist')
    fill_in("name", :with => "test stylist")
    click_button("Add Stylist")
    click_link('test stylist')
    click_link('Edit test stylist info')
    click_button('Delete Stylist')
    expect(page).to have_content("There are currently no stylists")
  end
end
