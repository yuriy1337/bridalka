require 'test_helper'

class GalleryTypesControllerTest < ActionController::TestCase
  setup do
    @gallery_type = gallery_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gallery_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery_type" do
    assert_difference('GalleryType.count') do
      post :create, gallery_type: { name: @gallery_type.name }
    end

    assert_redirected_to gallery_type_path(assigns(:gallery_type))
  end

  test "should show gallery_type" do
    get :show, id: @gallery_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gallery_type
    assert_response :success
  end

  test "should update gallery_type" do
    put :update, id: @gallery_type, gallery_type: { name: @gallery_type.name }
    assert_redirected_to gallery_type_path(assigns(:gallery_type))
  end

  test "should destroy gallery_type" do
    assert_difference('GalleryType.count', -1) do
      delete :destroy, id: @gallery_type
    end

    assert_redirected_to gallery_types_path
  end
end
