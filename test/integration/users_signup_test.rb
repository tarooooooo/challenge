require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, params: { user: { nickname:  "",
                                         email: "user@mail.com",
                                         introduction: "",
                                         icon_image: "",
                                         deleted: "",
                                         password:              "password",
                                         password_confirmation: "password_confirmation" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
     post users_path, params: { user: { nickname:  "name",
                                         email: "user@mail.com",
                                         introduction: "introduction",
                                         icon_image: "image",
                                         deleted: false,
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
