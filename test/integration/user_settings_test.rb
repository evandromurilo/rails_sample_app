require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:nathalya)
    end

    # test "change animal to cat, dog, and rat" do
    #     log_in_as @user, password: "12345678"
    #     get settings_path
    #     assert_response :success
    #     patch settings_path, params: { user: { animal: "cat" } }
    #     get root_path
    #     assert_select "#kitten-big"
    #     get settings_path
    #     patch settings_path, params: { user: { animal: "dog" } }
    #     get root_path
    #     assert_select "#dog"
    #     get settings_path
    #     patch settings_path, params: { user: { animal: "rat" } }
    #     get root_path
    #     assert_select "#rat"
    # end
end
