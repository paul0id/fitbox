require 'test_helper'

class FitBoxesControllerTest < ActionController::TestCase
  setup do
    @fit_box = fit_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fit_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fit_box" do
    assert_difference('FitBox.count') do
      post :create, fit_box: {  }
    end

    assert_redirected_to fit_box_path(assigns(:fit_box))
  end

  test "should show fit_box" do
    get :show, id: @fit_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fit_box
    assert_response :success
  end

  test "should update fit_box" do
    patch :update, id: @fit_box, fit_box: {  }
    assert_redirected_to fit_box_path(assigns(:fit_box))
  end

  test "should destroy fit_box" do
    assert_difference('FitBox.count', -1) do
      delete :destroy, id: @fit_box
    end

    assert_redirected_to fit_boxes_path
  end
end
