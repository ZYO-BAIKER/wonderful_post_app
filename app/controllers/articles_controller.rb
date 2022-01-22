class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update,:destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save!
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      @article.save!
      redirect_to incompanies_path
    else
      render action: :edit
    end
  end

  def destroy
    @article.destroy!
    redirect_to incompanies_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
