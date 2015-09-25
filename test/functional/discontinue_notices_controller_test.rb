require 'test_helper'

class DiscontinueNoticesControllerTest < ActionController::TestCase
  setup do
    @discontinue_notice = discontinue_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discontinue_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discontinue_notice" do
    assert_difference('DiscontinueNotice.count') do
      post :create, discontinue_notice: { class_day: @discontinue_notice.class_day, class_time: @discontinue_notice.class_time, last_day: @discontinue_notice.last_day, parent_name: @discontinue_notice.parent_name, reason: @discontinue_notice.reason, student_name: @discontinue_notice.student_name, understood: @discontinue_notice.understood }
    end

    assert_redirected_to discontinue_notice_path(assigns(:discontinue_notice))
  end

  test "should show discontinue_notice" do
    get :show, id: @discontinue_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discontinue_notice
    assert_response :success
  end

  test "should update discontinue_notice" do
    put :update, id: @discontinue_notice, discontinue_notice: { class_day: @discontinue_notice.class_day, class_time: @discontinue_notice.class_time, last_day: @discontinue_notice.last_day, parent_name: @discontinue_notice.parent_name, reason: @discontinue_notice.reason, student_name: @discontinue_notice.student_name, understood: @discontinue_notice.understood }
    assert_redirected_to discontinue_notice_path(assigns(:discontinue_notice))
  end

  test "should destroy discontinue_notice" do
    assert_difference('DiscontinueNotice.count', -1) do
      delete :destroy, id: @discontinue_notice
    end

    assert_redirected_to discontinue_notices_path
  end
end
