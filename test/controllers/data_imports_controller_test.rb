require "test_helper"

class DataImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get data_import_create_url
    assert_response :success
  end
end
