require 'test_helper'

class PackageTypesControllerTest < ActionController::TestCase
  setup do
    @package_type = package_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:package_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package_type" do
    assert_difference('PackageType.count') do
      post :create, package_type: @package_type.attributes
    end

    assert_redirected_to package_type_path(assigns(:package_type))
  end

  test "should show package_type" do
    get :show, id: @package_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package_type.to_param
    assert_response :success
  end

  test "should update package_type" do
    put :update, id: @package_type.to_param, package_type: @package_type.attributes
    assert_redirected_to package_type_path(assigns(:package_type))
  end

  test "should destroy package_type" do
    assert_difference('PackageType.count', -1) do
      delete :destroy, id: @package_type.to_param
    end

    assert_redirected_to package_types_path
  end
end
