require 'test_helper'

class MeaningsControllerTest < ActionController::TestCase
  setup do
    @meaning = meanings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meanings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meaning" do
    assert_difference('Meaning.count') do
      post :create, meaning: @meaning.attributes
    end

    assert_redirected_to meaning_path(assigns(:meaning))
  end

  test "should show meaning" do
    get :show, id: @meaning.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meaning.to_param
    assert_response :success
  end

  test "should update meaning" do
    put :update, id: @meaning.to_param, meaning: @meaning.attributes
    assert_redirected_to meaning_path(assigns(:meaning))
  end

  test "should destroy meaning" do
    assert_difference('Meaning.count', -1) do
      delete :destroy, id: @meaning.to_param
    end

    assert_redirected_to meanings_path
  end
end
