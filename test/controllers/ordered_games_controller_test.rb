require 'test_helper'

class OrderedGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ordered_games_index_url
    assert_response :success
  end

end
