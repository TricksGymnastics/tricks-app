require 'test_helper'

class SurveysTakensControllerTest < ActionController::TestCase
  setup do
    @surveys_taken = surveys_takens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys_takens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surveys_taken" do
    assert_difference('SurveysTaken.count') do
      post :create, surveys_taken: {  }
    end

    assert_redirected_to surveys_taken_path(assigns(:surveys_taken))
  end

  test "should show surveys_taken" do
    get :show, id: @surveys_taken
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @surveys_taken
    assert_response :success
  end

  test "should update surveys_taken" do
    put :update, id: @surveys_taken, surveys_taken: {  }
    assert_redirected_to surveys_taken_path(assigns(:surveys_taken))
  end

  test "should destroy surveys_taken" do
    assert_difference('SurveysTaken.count', -1) do
      delete :destroy, id: @surveys_taken
    end

    assert_redirected_to surveys_takens_path
  end
end
