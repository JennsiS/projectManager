require "test_helper"

class ImportantDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @important_date = important_dates(:one)
  end

  test "should get index" do
    get important_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_important_date_url
    assert_response :success
  end

  test "should create important_date" do
    assert_difference("ImportantDate.count") do
      post important_dates_url, params: { important_date: { date: @important_date.date, description: @important_date.description, name: @important_date.name } }
    end

    assert_redirected_to important_date_url(ImportantDate.last)
  end

  test "should show important_date" do
    get important_date_url(@important_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_important_date_url(@important_date)
    assert_response :success
  end

  test "should update important_date" do
    patch important_date_url(@important_date), params: { important_date: { date: @important_date.date, description: @important_date.description, name: @important_date.name } }
    assert_redirected_to important_date_url(@important_date)
  end

  test "should destroy important_date" do
    assert_difference("ImportantDate.count", -1) do
      delete important_date_url(@important_date)
    end

    assert_redirected_to important_dates_url
  end
end
