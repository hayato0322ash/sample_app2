require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest


  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation" 
    assert_select "form[action=?]", signup_path
  end

  test "valid signup information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path,params:{ user:{ 
        name:"テスト太郎",
        email:"hayato0322biz@gmail.com",
        password:"h03220322",
        password_confirmation:"h03220322"
      }}
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
  end
  

end
