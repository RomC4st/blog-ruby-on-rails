class ArticleController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) 
  end

  def new

    if current_user.has_role? :admin
      @article = Article.new
    else
      redirect_to article_index_path
    end
  end

  def create
    params[:article][:user_id] =current_user.id
    if current_user.has_role? :admin
      @article = Article.create(article_params)
      redirect_to article_path(@article)
    else
      raise StandardError.new('Something went wrong.')
    end

  end

  def edit
  
    if current_user.has_role? :admin
      @article = Article.find(params[:id])
    else
      redirect_to article_index_path
    end
  end

  def update
    params[:article][:user_id] =current_user.id
    if current_user.has_role? :admin
      @article = Article.find(params[:id])
      @article.update(article_params)
      redirect_to article_path(@article)
    else
      raise StandardError.new('Something went wrong.')
    end
  end

  def destroy
    if current_user.has_role? :admin
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to :action => "index"
    else
      raise StandardError.new('Something went wrong.')
    end
  end

  def article_params
    params.require(:article).permit(:name, :content , :user_id)
  end

end
