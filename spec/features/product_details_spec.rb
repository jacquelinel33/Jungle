require 'rails_helper'

RSpec.feature "Visitor can navigate from home page to product detail page when clicking on product", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can see product details page" do
  # ACT
  visit root_path
  click_on('Details', match: :first) 
  sleep 5

  # DEBUG / VERIFY
  save_screenshot
  expect(page).to have_css('.product-detail')
  end

end
