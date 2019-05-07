require 'test_helper'

class WebsitePdfsControllerTest < ActionController::TestCase
  setup do
    @website_pdf = website_pdfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:website_pdfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create website_pdf" do
    assert_difference('WebsitePdf.count') do
      post :create, website_pdf: { file: @website_pdf.file, file_name: @website_pdf.file_name }
    end

    assert_redirected_to website_pdf_path(assigns(:website_pdf))
  end

  test "should show website_pdf" do
    get :show, id: @website_pdf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @website_pdf
    assert_response :success
  end

  test "should update website_pdf" do
    put :update, id: @website_pdf, website_pdf: { file: @website_pdf.file, file_name: @website_pdf.file_name }
    assert_redirected_to website_pdf_path(assigns(:website_pdf))
  end

  test "should destroy website_pdf" do
    assert_difference('WebsitePdf.count', -1) do
      delete :destroy, id: @website_pdf
    end

    assert_redirected_to website_pdfs_path
  end
end
