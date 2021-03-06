require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
    test "invalid signup information" do
        get signup_path
        assert_no_difference 'User.count' do
            assert_select 'form[action="/signup"]'
            post signup_path, params: { user: { name: "",
                                            email: "user@invalid",
                                            password: "foo",
                                            password_confirmation: "bar" } }
        end
        assert_template 'users/new'
        
        assert_select 'div#error_explanation'
        assert_select 'div#error_explanation ul li', 4
        assert_select 'div.field_with_errors', 8
    end
    
    test "valid signup information" do
        get signup_path
        assert_difference 'User.count', 1 do
            assert_select 'form[action="/signup"]'
            post signup_path, params: { user: { name: "Evandro Murilo",
                                                email: "evandromurilob@hotmail.com",
                                                password: "12345678",
                                                password_confirmation: "12345678" }}
        end
        follow_redirect!
        assert_template 'users/show'
        assert_select 'div.alert-success'
        assert is_logged_in?
    end
end
