require 'test_helper'

class RecitalAdsControllerTest < ActionController::TestCase
  setup do
    @recital_ad = recital_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recital_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recital_ad" do
    assert_difference('RecitalAd.count') do
      post :create, recital_ad: {  }
    end

    assert_redirected_to recital_ad_path(assigns(:recital_ad))
  end

  test "should show recital_ad" do
    get :show, id: @recital_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recital_ad
    assert_response :success
  end

  test "should update recital_ad" do
    put :update, id: @recital_ad, recital_ad: {  }
    assert_redirected_to recital_ad_path(assigns(:recital_ad))
  end

  test "should destroy recital_ad" do
    assert_difference('RecitalAd.count', -1) do
      delete :destroy, id: @recital_ad
    end

    assert_redirected_to recital_ads_path
  end
end
