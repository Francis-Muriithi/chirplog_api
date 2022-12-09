require "test_helper"

class AdventuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adventure = adventures(:one)
  end

  test "should get index" do
    get adventures_url, as: :json
    assert_response :success
  end

  test "should create adventure" do
    assert_difference("Adventure.count") do
      post adventures_url, params: { adventure: { location: @adventure.location, title: @adventure.title } }, as: :json
    end

    assert_response :created
  end

  test "should show adventure" do
    get adventure_url(@adventure), as: :json
    assert_response :success
  end

  test "should update adventure" do
    patch adventure_url(@adventure), params: { adventure: { location: @adventure.location, title: @adventure.title } }, as: :json
    assert_response :success
  end

  test "should destroy adventure" do
    assert_difference("Adventure.count", -1) do
      delete adventure_url(@adventure), as: :json
    end

    assert_response :no_content
  end
end
