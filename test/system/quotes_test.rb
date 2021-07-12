require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Final price", with: @quote.final_price
    fill_in "Installation fees", with: @quote.installation_fees
    fill_in "Name", with: @quote.name
    fill_in "Number of elevator", with: @quote.number_of_elevator
    fill_in "Product line", with: @quote.product_line
    fill_in "Total price of elevators", with: @quote.total_price_of_elevators
    fill_in "Unit price of each elevator", with: @quote.unit_price_of_each_elevator
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Final price", with: @quote.final_price
    fill_in "Installation fees", with: @quote.installation_fees
    fill_in "Name", with: @quote.name
    fill_in "Number of elevator", with: @quote.number_of_elevator
    fill_in "Product line", with: @quote.product_line
    fill_in "Total price of elevators", with: @quote.total_price_of_elevators
    fill_in "Unit price of each elevator", with: @quote.unit_price_of_each_elevator
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
