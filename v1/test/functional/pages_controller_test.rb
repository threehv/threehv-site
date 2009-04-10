require File.dirname(__FILE__) + '/../test_helper'
require 'pages_controller'

# Re-raise errors caught by the controller.
class PagesController; def rescue_action(e) raise e end; end

class PagesControllerTest < Test::Unit::TestCase
  def setup
    @controller = PagesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def check page_name, page_title
    get :show_by_seo_title, :seo_title => page_name
    
    assert_response :success
    assert_template page_name
    assert_equal page_title, assigns(:page_title)
  end

  # Check the web development/Ruby on Rails page
  def test_ruby_on_rails_page
    check 'services', 'Services'
  end
  
  # Check the about page
  def test_about_page
    check 'about', '3hv - execution is everything'  
  end
  
  # Check the contact page
  def test_contact_page
    check 'contact', 'Contact 3hv'
  end
  
  # Check the principles page
  def test_principles_page
    check 'principles', 'Principles'
  end
  
  # Check the showcase page
  def test_showcase_page
    check 'showcase', 'Showcase'
  end
end
