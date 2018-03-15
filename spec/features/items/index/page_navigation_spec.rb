RSpec.describe 'Page navigation', type: :feature do
  it 'shows all items' do
    visit '/items'

    expect(page).to have_content('Items')
  end
  it 'takes you from index to new' do
    visit '/items'
    click_button 'Create a new item'

    expect(page).has_xpath?('//items/new')
  end
end
