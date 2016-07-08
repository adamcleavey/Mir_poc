require 'test_helper'

class MirrorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mirror = mirrors(:one)
  end

  test "should get index" do
    get mirrors_url
    assert_response :success
  end

  test "should get new" do
    get new_mirror_url
    assert_response :success
  end

  test "should create mirror" do
    assert_difference('Mirror.count') do
      post mirrors_url, params: { mirror: { frequency: @mirror.frequency, last_updated: @mirror.last_updated, mirrored_url: @mirror.mirrored_url, name: @mirror.name, notes: @mirror.notes, source: @mirror.source } }
    end

    assert_redirected_to mirror_url(Mirror.last)
  end

  test "should show mirror" do
    get mirror_url(@mirror)
    assert_response :success
  end

  test "should get edit" do
    get edit_mirror_url(@mirror)
    assert_response :success
  end

  test "should update mirror" do
    patch mirror_url(@mirror), params: { mirror: { frequency: @mirror.frequency, last_updated: @mirror.last_updated, mirrored_url: @mirror.mirrored_url, name: @mirror.name, notes: @mirror.notes, source: @mirror.source } }
    assert_redirected_to mirror_url(@mirror)
  end

  test "should destroy mirror" do
    assert_difference('Mirror.count', -1) do
      delete mirror_url(@mirror)
    end

    assert_redirected_to mirrors_url
  end
end
