require 'test_helper'

class KoalasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @koala = koalas(:one)
  end

  test "should get index" do
    get koalas_url
    assert_response :success
  end

  test "should get new" do
    get new_koala_url
    assert_response :success
  end

  test "should create koala" do
    assert_difference('Koala.count') do
      post koalas_url, params: { koala: { character: @koala.character, colour: @koala.colour, dob: @koala.dob, favourite_food: @koala.favourite_food, name: @koala.name } }
    end

    assert_redirected_to koala_url(Koala.last)
  end

  test "should show koala" do
    get koala_url(@koala)
    assert_response :success
  end

  test "should get edit" do
    get edit_koala_url(@koala)
    assert_response :success
  end

  test "should update koala" do
    patch koala_url(@koala), params: { koala: { character: @koala.character, colour: @koala.colour, dob: @koala.dob, favourite_food: @koala.favourite_food, name: @koala.name } }
    assert_redirected_to koala_url(@koala)
  end

  test "should destroy koala" do
    assert_difference('Koala.count', -1) do
      delete koala_url(@koala)
    end

    assert_redirected_to koalas_url
  end
end
