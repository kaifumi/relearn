require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posts_new_url
    assert_response :success
  end

  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get genre_index" do
    get posts_genre_index_url
    assert_response :success
  end

  test "should get show" do
    get posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get posts_edit_url
    assert_response :success
  end

  test "should get complete_top" do
    get posts_complete_top_url
    assert_response :success
  end

  test "should get complete_show" do
    get posts_complete_show_url
    assert_response :success
  end

end
