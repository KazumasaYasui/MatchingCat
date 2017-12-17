class UsersController < ApplicationController
  def index
  end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
    end
  end

  def my_cat
    @user = User.find(params[:id])
    if current_user.admin?
      @cats = @user.cats.order(created_at: :desc)
    end
  end

  def my_article
    @user = User.find(params[:id])
    if current_user.admin?
      @articles = @user.articles.order(created_at: :desc)
    end
  end

  def my_event
    @user = User.find(params[:id])
    if current_user.admin?
      @events = @user.events.order(created_at: :desc)
    end
  end

  def my_post
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end
end
