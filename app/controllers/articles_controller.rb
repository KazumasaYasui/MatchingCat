class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,
                except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @articles = Article.all.order(created_at: :desc)
                       .page(params[:page]).per(20)
  end

  def show
    prepare_meta_tags(title: @article.article_title)
  end

  def new
    if current_user.admin?
      @article = Article.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: '記事が作成されました。'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: '記事が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
      redirect_to articles_path, notice: '記事が削除されました。'
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article)
            .permit(
              :article_title, :article_body, :image, :user_id
            )
    end

    def correct_user
      @article = Article.find(params[:id])
      if current_user.id != @article.user.id
        redirect_to root_path
      end
    end
end
