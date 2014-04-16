class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

 def create
    @article = Article.new(article_params)
      if @article.save
        redirect_to articles_path :notice => "Article was created succesfully"
      else
        render :new
      end
  end 

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def update
   if @article.update(article_params)
    redirect_to articles_path, :notice => "Successfully updated"
  else
    render 'edit'
  end
  end

  def destroy
   @article.destroy
    redirect_to articles_path, :notice => "User has been successfully destroyed :C !" 
  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end