class ArticlesController < ApplicationController
  respond_to :html, :json

  def show
    @article = Article.find(params[:id]).decorate(context: {role: :admin})
  end

  def index
    @articles, @tag = Article.search_by_tag_name(params[:tag])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    flash[:notice] = @article.save ? "Your article was created." : "Article failed to save."
    # respond_with @article, location: articles_path
    render formats: [:html, :json]
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to articles_path
  end
end
