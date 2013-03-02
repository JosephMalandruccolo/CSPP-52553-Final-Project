require 'test_helper'

class CollegesControllerTest < ActionController::TestCase
  setup do
    @college = colleges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colleges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create college" do
    assert_difference('College.count') do
      post :create, college: { city: @college.city, facebook: @college.facebook, instagram: @college.instagram, logo: @college.logo, officialName: @college.officialName, shortName: @college.shortName, state: @college.state, twitter: @college.twitter, wikipedia: @college.wikipedia }
    end

    assert_redirected_to college_path(assigns(:college))
  end

  test "should show college" do
    get :show, id: @college
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @college
    assert_response :success
  end

  test "should update college" do
    put :update, id: @college, college: { city: @college.city, facebook: @college.facebook, instagram: @college.instagram, logo: @college.logo, officialName: @college.officialName, shortName: @college.shortName, state: @college.state, twitter: @college.twitter, wikipedia: @college.wikipedia }
    assert_redirected_to college_path(assigns(:college))
  end

  test "should destroy college" do
    assert_difference('College.count', -1) do
      delete :destroy, id: @college
    end

    assert_redirected_to colleges_path
  end
end
