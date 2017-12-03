class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,
                except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @cats = Cat.all.order(created_at: :desc)
  end

  def show
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
      redirect_to @cat, notice: '保護猫が作成されました。'
    else
      render :new
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat, notice: '保護猫が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
      redirect_to cats_path, notice: '保護猫が削除されました。'
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
    end

    def cat_params
      params.require(:cat)
            .permit(
              :cat_name, :cat_age, :cat_sex, :cat_breed,
              :cat_prefecture, :cat_description, :user_id
            )
    end

    def correct_user
      @cat = Cat.find(params[:id])
      if current_user.id != @cat.user.id
        redirect_to root_path
      end
    end
end
