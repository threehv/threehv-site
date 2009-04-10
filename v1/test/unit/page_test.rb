require File.dirname(__FILE__) + '/../test_helper'

class PageTest < Test::Unit::TestCase
  fixtures :pages

  def test_that_seo_title_is_unique
    page = Page.new :title => 'Web Development', :seo_title => 'web-development', :contents => 'hello'
    
    assert !page.valid?
    assert page.errors.on(:seo_title)
  end
  
  def test_that_title_is_present
    page = Page.new :seo_title => 'whatever', :contents => 'whatever'
    
    assert !page.valid?
    assert page.errors.on(:title)
  end
  
  def test_that_seo_title_is_generated
    page = Page.new :title => 'Hello World', :contents => 'hello world'
    
    assert page.valid?
    assert_equal 'hello_world', page.seo_title
  end
  
  def test_that_seo_title_is_not_generated_if_explicitly_provided
    page = Page.new :title => 'Something', :seo_title => 'something_page', :contents => 'whatever'
    
    assert page.valid?
    assert_equal 'something_page', page.seo_title
  end
  
end
