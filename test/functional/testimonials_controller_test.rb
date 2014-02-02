require 'test_helper'

class TestimonialsControllerTest < ActionController::TestCase
  setup do
    @testimonial = testimonials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testimonials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testimonial" do
    assert_difference('Testimonial.count') do
      post :create, testimonial: { text: @testimonial.text }
    end

    assert_redirected_to testimonial_path(assigns(:testimonial))
  end

  test "should show testimonial" do
    get :show, id: @testimonial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testimonial
    assert_response :success
  end

  test "should update testimonial" do
    put :update, id: @testimonial, testimonial: { text: @testimonial.text }
    assert_redirected_to testimonial_path(assigns(:testimonial))
  end

  test "should destroy testimonial" do
    assert_difference('Testimonial.count', -1) do
      delete :destroy, id: @testimonial
    end

    assert_redirected_to testimonials_path
  end
end
