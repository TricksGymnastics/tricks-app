require 'test_helper'

class BubbleContentsControllerTest < ActionController::TestCase
  setup do
    @bubble_content = bubble_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bubble_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bubble_content" do
    assert_difference('BubbleContent.count') do
      post :create, bubble_content: { color: @bubble_content.color, image: @bubble_content.image, link: @bubble_content.link, show_button: @bubble_content.show_button, text: @bubble_content.text, text_color: @bubble_content.text_color }
    end

    assert_redirected_to bubble_content_path(assigns(:bubble_content))
  end

  test "should show bubble_content" do
    get :show, id: @bubble_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bubble_content
    assert_response :success
  end

  test "should update bubble_content" do
    patch :update, id: @bubble_content, bubble_content: { color: @bubble_content.color, image: @bubble_content.image, link: @bubble_content.link, show_button: @bubble_content.show_button, text: @bubble_content.text, text_color: @bubble_content.text_color }
    assert_redirected_to bubble_content_path(assigns(:bubble_content))
  end

  test "should destroy bubble_content" do
    assert_difference('BubbleContent.count', -1) do
      delete :destroy, id: @bubble_content
    end

    assert_redirected_to bubble_contents_path
  end
end
