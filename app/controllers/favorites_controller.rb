class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @cat = Cat.find(params[:cat_id])
    @favorite = current_user.favorites.build(cat: @cat)
    if @favorite.save
      redirect_to cats_path, notice: "お気に入りに登録しました"
    else
      redirect_to cats_path, alert: "お気に入りに登録できません"
    end
  end

  def destroy
    @cat = Cat.find(params[:cat_id])
    @favorite = current_user.favorites.find_by!(
                  cat_id: params[:cat_id]
                )
    @favorite.destroy
    redirect_to cats_path, notice: "お気に入りを解除しました"
  end
end
