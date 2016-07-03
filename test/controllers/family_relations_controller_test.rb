require 'test_helper'

class FamilyRelationsControllerTest < ActionController::TestCase
  setup do
    @family_relation = family_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_relation" do
    assert_difference('FamilyRelation.count') do
      post :create, family_relation: {  }
    end

    assert_redirected_to family_relation_path(assigns(:family_relation))
  end

  test "should show family_relation" do
    get :show, id: @family_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @family_relation
    assert_response :success
  end

  test "should update family_relation" do
    patch :update, id: @family_relation, family_relation: {  }
    assert_redirected_to family_relation_path(assigns(:family_relation))
  end

  test "should destroy family_relation" do
    assert_difference('FamilyRelation.count', -1) do
      delete :destroy, id: @family_relation
    end

    assert_redirected_to family_relations_path
  end
end
