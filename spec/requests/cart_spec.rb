require 'rails_helper'

RSpec.describe "Cart", type: :request do
    it 'go to the cart without items' do
      visit folders_cart_path
      expect(page).to have_text('My cart')
      expect(page).to have_text("No items in cart.")      
    end
    
    it 'go to the cart with items' do
      visit "/folders/add_to_cart/1"
      visit "/folders/add_to_cart/2"
      visit "/folders/add_to_cart/3"
      visit folders_cart_path
      expect(page).to have_text('My cart')
      expect(page).to have_text("Soviet Power Collapse in Eastern Europe - Strategic Arms Control (June 1990)")
      expect(page).to have_text("Special Channel (January - June) 1991 [2]")      
      expect(page).to have_text("Special Channel (January - June) 1991 [5]")      
    end
    
    it 'add item to cart' do
        search_results = double(Array).as_null_object
        expect(Folder).to receive(:search_folders).with("soviet's loss of power in eastern europe").and_return(search_results)
        get("/folders/search", params:{query: "soviet's loss of power in eastern europe", page: 1})
        page.has_link?('add to cart')
        visit "/folders/add_to_cart/1"
    end
    
    it 'remove item from cart' do
        visit "/folders/add_to_cart/1"
        visit folders_cart_path
        page.click_on('Remove from cart')
        visit "/folders/remove_from_cart/1"
    end
end
    