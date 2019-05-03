require 'test_helper'

class RecitalAdTypesControllerTest < ActionController::TestCase
  setup do
    @recital_ad_type = recital_ad_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recital_ad_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recital_ad_type" do
    assert_difference('RecitalAdType.count') do
      post :create, recital_ad_type: { name: @recital_ad_type.name }
    end

    assert_redirected_to recital_ad_type_path(assigns(:recital_ad_type))
  end

  test "should show recital_ad_type" do
    get :show, id: @recital_ad_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recital_ad_type
    assert_response :success
  end

  test "should update recital_ad_type" do
    put :update, id: @recital_ad_type, recital_ad_type: { name: @recital_ad_type.name }
    assert_redirected_to recital_ad_type_path(assigns(:recital_ad_type))
  end

  test "should destroy recital_ad_type" do
    assert_difference('RecitalAdType.count', -1) do
      delete :destroy, id: @recital_ad_type
    end

    assert_redirected_to recital_ad_types_path
  end
end
