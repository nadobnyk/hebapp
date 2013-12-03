require 'test_helper'

class CostItemsControllerTest < ActionController::TestCase
  setup do
    @cost_item = cost_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cost_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost_item" do
    assert_difference('CostItem.count') do
      post :create, cost_item: { date: @cost_item.date, quantity: @cost_item.quantity }
    end

    assert_redirected_to cost_item_path(assigns(:cost_item))
  end

  test "should show cost_item" do
    get :show, id: @cost_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost_item
    assert_response :success
  end

  test "should update cost_item" do
    put :update, id: @cost_item, cost_item: { date: @cost_item.date, quantity: @cost_item.quantity }
    assert_redirected_to cost_item_path(assigns(:cost_item))
  end

  test "should destroy cost_item" do
    assert_difference('CostItem.count', -1) do
      delete :destroy, id: @cost_item
    end

    assert_redirected_to cost_items_path
  end
end
