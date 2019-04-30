require 'test_helper'

class RecitalSignUpsControllerTest < ActionController::TestCase
  setup do
    @recital_sign_up = recital_sign_ups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recital_sign_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recital_sign_up" do
    assert_difference('RecitalSignUp.count') do
      post :create, recital_sign_up: { child_first_name: @recital_sign_up.child_first_name, child_last_name: @recital_sign_up.child_last_name, costume_fee_agreement: @recital_sign_up.costume_fee_agreement, location: @recital_sign_up.location, multiple_children: @recital_sign_up.multiple_children, multiple_recitals: @recital_sign_up.multiple_recitals, participating: @recital_sign_up.participating, recital_fee_agreement: @recital_sign_up.recital_fee_agreement, total_recitals: @recital_sign_up.total_recitals }
    end

    assert_redirected_to recital_sign_up_path(assigns(:recital_sign_up))
  end

  test "should show recital_sign_up" do
    get :show, id: @recital_sign_up
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recital_sign_up
    assert_response :success
  end

  test "should update recital_sign_up" do
    patch :update, id: @recital_sign_up, recital_sign_up: { child_first_name: @recital_sign_up.child_first_name, child_last_name: @recital_sign_up.child_last_name, costume_fee_agreement: @recital_sign_up.costume_fee_agreement, location: @recital_sign_up.location, multiple_children: @recital_sign_up.multiple_children, multiple_recitals: @recital_sign_up.multiple_recitals, participating: @recital_sign_up.participating, recital_fee_agreement: @recital_sign_up.recital_fee_agreement, total_recitals: @recital_sign_up.total_recitals }
    assert_redirected_to recital_sign_up_path(assigns(:recital_sign_up))
  end

  test "should destroy recital_sign_up" do
    assert_difference('RecitalSignUp.count', -1) do
      delete :destroy, id: @recital_sign_up
    end

    assert_redirected_to recital_sign_ups_path
  end
end
