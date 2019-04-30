require 'test_helper'

schedule KidQuotesControllerTest < ActionController::TestCase
  setup do
    @kid_quote = kid_quotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kid_quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kid_quote" do
    assert_difference('KidQuote.count') do
      post :create, kid_quote: @kid_quote.attributes
    end

    assert_redirected_to kid_quote_path(assigns(:kid_quote))
  end

  test "should show kid_quote" do
    get :show, id: @kid_quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kid_quote
    assert_response :success
  end

  test "should update kid_quote" do
    put :update, id: @kid_quote, kid_quote: @kid_quote.attributes
    assert_redirected_to kid_quote_path(assigns(:kid_quote))
  end

  test "should destroy kid_quote" do
    assert_difference('KidQuote.count', -1) do
      delete :destroy, id: @kid_quote
    end

    assert_redirected_to kid_quotes_path
  end
end
