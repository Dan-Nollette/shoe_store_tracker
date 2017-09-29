require('spec_helper')

describe('starting the app', {:type => :feature}) do
  it('loads the main page') do
    visit('/')
    expect(page).to have_content('Shoe Store and Shoe Brand Tracker')
  end
end

describe('go to the page to add a new store', {:type => :feature}) do
  it('loads the store creation page') do
    visit('/')
    click_link('Create a new Store')
    expect(page).to have_content('Create New Store')
  end
end

describe('go to the page to add a new brand', {:type => :feature}) do
  it('loads the brand creation page') do
    visit('/')
    click_link('Create a new Brand')
    expect(page).to have_content('Create New Brand')
  end
end

describe('create new brand', {:type => :feature}) do
  it('submits the brand creation form') do
    visit('/brands/new')
    fill_in('name', :with =>'Nike')
    click_button('Submit')
    expect(page).to have_content('Nike')
  end
end

describe('create new store', {:type => :feature}) do
  it('submits the store creation form') do
    visit('/stores/new')
    fill_in('name', :with =>'Boot Locker')
    click_button('Submit')
    expect(page).to have_content('Boot Locker')
  end
end

describe('Go to a store', {:type => :feature}) do
  it('creates a store and then routes to it\'s store page') do
    store = Store.create({name: "Oh, fish!"})
    visit('/stores/' + store.id.to_s)
    expect(page).to have_content('Oh, fish!')
  end
end

describe('Go to a brand page', {:type => :feature}) do
  it('creates a brand and then routes to it\'s brand page') do
    brand = Brand.create({name: "Athena"})
    visit('/brands/' + brand.id.to_s)
    expect(page).to have_content("Athena")
  end
end
