require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { final_price: @quote.final_price, installation_fees: @quote.installation_fees, name: @quote.name, number_of_elevator: @quote.number_of_elevator, product_line: @quote.product_line, total_price_of_elevators: @quote.total_price_of_elevators, unit_price_of_each_elevator: @quote.unit_price_of_each_elevator } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { final_price: @quote.final_price, installation_fees: @quote.installation_fees, name: @quote.name, number_of_elevator: @quote.number_of_elevator, product_line: @quote.product_line, total_price_of_elevators: @quote.total_price_of_elevators, unit_price_of_each_elevator: @quote.unit_price_of_each_elevator } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
