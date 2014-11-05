require 'test_helper'

class CandidtatesControllerTest < ActionController::TestCase
  setup do
    @candidtate = candidtates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidtates)
  end

  test "should create candidtate" do
    assert_difference('Candidtate.count') do
      post :create, candidtate: { name: @candidtate.name, party: @candidtate.party }
    end

    assert_response 201
  end

  test "should show candidtate" do
    get :show, id: @candidtate
    assert_response :success
  end

  test "should update candidtate" do
    put :update, id: @candidtate, candidtate: { name: @candidtate.name, party: @candidtate.party }
    assert_response 204
  end

  test "should destroy candidtate" do
    assert_difference('Candidtate.count', -1) do
      delete :destroy, id: @candidtate
    end

    assert_response 204
  end
end
