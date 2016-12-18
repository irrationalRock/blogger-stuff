class ArticlesController < ApplicationController
	def index
  		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new
 	    @article.title = params[:article][:title]
 	    @article.body = params[:article][:body]
 	    @article.save
 	    redirect_to article_path(@article)

	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	#gets the information for editing
	def edit
 	    @article = Article.find(params[:id])
    end
    #updates the information to the database
    def update
        @article = Article.find(params[:id])
        @article.title = params[:article][:title]
 	    @article.body = params[:article][:body]
 	    @article.save

        flash.notice = "Article '#{@article.title}' Updated!"
        redirect_to article_path(@article)
end
end
