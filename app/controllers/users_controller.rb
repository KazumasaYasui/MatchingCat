class UsersController < ApplicationController
  before_action :set_user, only: [:my_cat, :my_article, :my_event, :my_post, :cat_history, :event_history, :my_favorite]

  # def index
  # end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
    end
  end

  def my_cat
    if current_user.admin?
      @cats = @user.cats.includes(:cat_images)
                   .page(params[:page]).per(20)
                   .order(created_at: :desc)
    end
  end

  def my_article
    if current_user.admin?
      @articles = @user.articles
                       .page(params[:page]).per(20)
                       .order(created_at: :desc)
    end
  end

  def my_event
    if current_user.admin?
      @events = @user.events
                     .page(params[:page]).per(20)
                     .order(created_at: :desc)
    end
  end

  def my_post
    @posts = @user.posts.includes(:post_images)
                        .page(params[:page]).per(20)
                        .order(created_at: :desc)
  end

  def cat_history
    if current_user.admin?
      @user_cats = @user.cats.includes(:order)
    else
      @orders = @user.orders.includes(:cat)
    end
  end

  def event_history
    if current_user.admin?
      @user_events = @user.events.includes(:reservations)
    else
      @reservations = @user.reservations.includes(:event)
    end
  end

  def my_favorite
    @favorites = @user.favorites.includes(cat: :cat_images)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
