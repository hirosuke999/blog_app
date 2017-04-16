class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @article.text = 'ユーザーが新規なのか、それともデータベースに存在する既存のユーザーであるか。'
    @article.tags.build
  end

  def create
    article = Article.new(article_params)

    if article.save
      redirect_to article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :text, tags_attributes: [:name])
    end
end
