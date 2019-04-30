require 'test_helper'

class PromoSlidesControllerTest < ActionController::TestCase
  setup do
    @promo_slide = promo_slides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promo_slides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promo_slide" do
    assert_difference('PromoSlide.count') do
      post :create, promo_slide: { data_type: @promo_slide.data_type, html_code: @promo_slide.html_code, image: @promo_slide.image, link: @promo_slide.link, live: @promo_slide.live, order: @promo_slide.order, title: @promo_slide.title }
    end

    assert_redirected_to promo_slide_path(assigns(:promo_slide))
  end

  test "should show promo_slide" do
    get :show, id: @promo_slide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promo_slide
    assert_response :success
  end

  test "should update promo_slide" do
    put :update, id: @promo_slide, promo_slide: { data_type: @promo_slide.data_type, html_code: @promo_slide.html_code, image: @promo_slide.image, link: @promo_slide.link, live: @promo_slide.live, order: @promo_slide.order, title: @promo_slide.title }
    assert_redirected_to promo_slide_path(assigns(:promo_slide))
  end

  test "should destroy promo_slide" do
    assert_difference('PromoSlide.count', -1) do
      delete :destroy, id: @promo_slide
    end

    assert_redirected_to promo_slides_path
  end
end
