class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,
                except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @events = Event.all.order(created_at: :desc)
                   .page(params[:page]).per(20)
    prepare_meta_tags(
      image: image_url('/images/event_img_sample.jpg')
    )
  end

  def show
    gon.latitude = @event.latitude
    gon.longitude = @event.longitude
    gon.address = @event.event_address
    prepare_meta_tags(
      title: @event.event_title,
      image: image_url('/images/event_img_sample.jpg')
    )
  end

  def new
    if current_user.admin?
      @event = Event.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to @event, notice: 'イベントが作成されました。'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'イベントが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
      redirect_to events_path, notice: 'イベントが削除されました。'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event)
            .permit(
              :event_title, :event_body, :event_remark,
              :event_datetime, :event_address, :image,
              :latitude, :longitude, :user_id, :event_people
            )
    end

    def correct_user
      @event = Event.find(params[:id])
      if current_user.id != @event.user.id
        redirect_to root_path
      end
    end
end
