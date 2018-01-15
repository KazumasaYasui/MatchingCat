class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,
                except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.all.includes(:post_images)
                 .order(created_at: :desc)
                 .page(params[:page]).per(20)
    prepare_meta_tags(
      image: image_url('/images/post_img_sample1.jpg')
    )
  end

  def show
    prepare_meta_tags(
      title: @post.post_title,
      image: image_url('/images/post_img_sample2.jpg')
    )
  end

  def new
      @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '投稿が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: '投稿が削除されました。'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post)
            .permit(
              :post_title, :post_body, :user_id,
              post_images_images: []
            )
    end

    def correct_user
      @post = Post.find(params[:id])
      if current_user.id != @post.user.id
        redirect_to root_path
      end
    end
end
