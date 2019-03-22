class PagesController < ApplicationController
  def home
  end
  
  def blog
 	article1 = {
	"title" => "1er article",
	"content" => "Blablabla",
	} 

	article2 = {
	"title" => "2eme article",
	"content" => "Blablabla",
	} 

	article3 = {
	"title" => "3eme article",
	"content" => "Blablabla",
	} 

	@articles = [ article1, article2, article3 ]
	
  end


end
