require 'test_helper'

class PalindormControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palindorm_input_url
    assert_response :success
  end

  test "should get output" do
    get palindorm_output_url
    assert_response :success
  end

end
