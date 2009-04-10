require File.dirname(__FILE__) + '/../test_helper'
require 'home_controller'

# Re-raise errors caught by the controller.
class HomeController; def rescue_action(e) raise e end; end

class HomeControllerTest < Test::Unit::TestCase
  def setup
    @controller = HomeController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_home_page
    get :show
    
    assert_response :success
    
    assert_equal '3hv - execution is everything', assigns(:page_title)
    assert_template 'show'
    
    assert_not_nil assigns(:articles)
  end 
  
end
