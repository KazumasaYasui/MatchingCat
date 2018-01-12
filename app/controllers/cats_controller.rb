class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,
                except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    # reset_session
    @cats = Cat.all.includes(:cat_images)
               .order(created_at: :desc)
               .page(params[:page]).per(20)
               .get_by_cat_sex(params[:cat_sex].presence)
               .get_by_cat_breed(params[:cat_breed].presence)
               .get_by_cat_prefecture(params[:cat_prefecture].presence)
  end

  def show
    prepare_meta_tags(title: @cat.cat_name)
  end

  def new
    if current_user.admin?
      @cat = Cat.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to @cat, notice: '保護ねこが作成されました。'
    else
      render :new
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat, notice: '保護ねこが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
      redirect_to cats_path, notice: '保護ねこが削除されました。'
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
    end

    def cat_params
      params.require(:cat)
            .permit(
              :cat_name, :cat_age, :cat_sex, :cat_breed,
              :cat_prefecture, :cat_description, :user_id,
              cat_images_images: []
            )
    end

    def correct_user
      @cat = Cat.find(params[:id])
      if current_user.id != @cat.user.id
        redirect_to root_path
      end
    end
end
