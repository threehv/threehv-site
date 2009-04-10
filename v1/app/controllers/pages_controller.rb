class PagesController < ApplicationController
  layout 'threehv'

  def show_by_seo_title
    @page_title = lookup_page_title_for params[:seo_title]
    render :action => params[:seo_title]
  end
  
  private

  @@page_titles = {
    'about' => '3hv - execution is everything',
    'contact' => 'Contact 3hv', 
    'services' => 'Services',
    'principles' => 'Principles',
    'showcase' => 'Showcase'
  }
  
  def lookup_page_title_for seo_title
    return @@page_titles[seo_title] || '3hv'
  end
end
