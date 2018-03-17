RSpec.describe Item, type: :feature do
  context 'Page content' do
    context 'Index page' do
      it 'shows all items' do
        visit '/items'

        expect(page).to have_content('Items')
      end
    end
  end
end
