class Page < ActiveRecord::Base
  validates_uniqueness_of :seo_title
  validates_presence_of :title
  
  before_validation :generate_seo_title
  
  private
  
  def generate_seo_title
    self.seo_title = self.title.gsub(' ', '').underscore if self.seo_title.blank?
  end
end
