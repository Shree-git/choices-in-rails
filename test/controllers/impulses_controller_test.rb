require "test_helper"

class ImpulsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @impulse = impulses(:one)
  end

  test "should get index" do
    get impulses_url
    assert_response :success
  end

  test "should get new" do
    get new_impulse_url
    assert_response :success
  end

  test "should create impulse" do
    assert_difference('Impulse.count') do
      post impulses_url, params: { impulse: { desc: @impulse.desc, level: @impulse.level, title: @impulse.title } }
    end

    assert_redirected_to impulse_url(Impulse.last)
  end

  test "should show impulse" do
    get impulse_url(@impulse)
    assert_response :success
  end

  test "should get edit" do
    get edit_impulse_url(@impulse)
    assert_response :success
  end

  test "should update impulse" do
    patch impulse_url(@impulse), params: { impulse: { desc: @impulse.desc, level: @impulse.level, title: @impulse.title } }
    assert_redirected_to impulse_url(@impulse)
  end

  test "should destroy impulse" do
    assert_difference('Impulse.count', -1) do
      delete impulse_url(@impulse)
    end

    assert_redirected_to impulses_url
  end
end
