require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class HomeController < ApplicationController
  layout 'threehv_no_menu'
  
  def show
    @page_title = '3hv - execution is everything'
    @articles = []
    @tweets = []
    get_articles_from 'http://feeds.feedburner.com/3hvtech?format=xml', :into => @articles
    get_articles_from 'http://feeds.feedburner.com/3hv?format=xml', :into => @articles
    #get_articles_from 'http://twitter.com/statuses/user_timeline/5903472.rss', :into => @tweets, :stripping_out => 'xbaz:'
end
  
  private
  
  class Article
    attr_accessor :title, :link, :description
  end
  
  def get_articles_from url, options
    articles = options[:into] || []
    content = ''
    
    begin
      open(url) do | s | 
        content = s.read
      end
  
      rss = RSS::Parser.parse content
      
      return if rss.nil? 
      
      text_to_strip = options[:stripping_out]
      
      4.times do | index | 
        if index < rss.items.size
          article = Article.new
          
          if text_to_strip.nil? 
            article.title = rss.items[index].title
          else
            article.title = rss.items[index].title.split(text_to_strip).last
          end
          article.link = rss.items[index].link
          article.description = rss.items[index].description
          articles << article
        end
      end
  
    rescue Exception => ex
      logger.error ex.message
    end
  end
  
end
