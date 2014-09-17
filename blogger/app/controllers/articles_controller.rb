class ArticlesController < ApplicationController
	def article_params
    	params.require(:article).permit(:title, :body, :tag_list)
  	end
	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
	def new
		@article = Article.new

	end
	def create
		@article = Article.new(article_params)
    	@article.save
    	flash.notice = "'#{@article.title}' has been Created!"
  		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "'#{@article.title}' has been Destroyed!"
		redirect_to articles_path(@article)
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "'#{@article.title}' has been Updated!"
		redirect_to article_path(@article)
	end
end
