require 'test_helper'

class LabelControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get label_new_url
    assert_response :success
  end

  test "should get index" do
    get label_index_url
    assert_response :success
  end

  test "should get edit" do
    get label_edit_url
    assert_response :success
  end

  test "should get show" do
    get label_show_url
    assert_response :success
  end

end
