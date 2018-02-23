require 'test_helper'

class MassmailsControllerTest < ActionController::TestCase
  setup do
    @massmail = massmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:massmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create massmail" do
    assert_difference('Massmail.count') do
      post :create, massmail: {  }
    end

    assert_redirected_to massmail_path(assigns(:massmail))
  end

  test "should show massmail" do
    get :show, id: @massmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @massmail
    assert_response :success
  end

  test "should update massmail" do
    patch :update, id: @massmail, massmail: {  }
    assert_redirected_to massmail_path(assigns(:massmail))
  end

  test "should destroy massmail" do
    assert_difference('Massmail.count', -1) do
      delete :destroy, id: @massmail
    end

    assert_redirected_to massmails_path
  end
end
