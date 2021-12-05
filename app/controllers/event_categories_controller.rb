class EventCategoriesController < ApplicationController
  before_action :set_event_category, only: %i[show edit update destroy]

  def index
    @q = EventCategory.ransack(params[:q])
    @event_categories = @q.result(distinct: true).includes(:events).page(params[:page]).per(10)
  end

  def show
    @event = Event.new
  end

  def new
    @event_category = EventCategory.new
  end

  def edit; end

  def create
    @event_category = EventCategory.new(event_category_params)

    if @event_category.save
      redirect_to @event_category,
                  notice: "Event category was successfully created."
    else
      render :new
    end
  end

  def update
    if @event_category.update(event_category_params)
      redirect_to @event_category,
                  notice: "Event category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event_category.destroy
    redirect_to event_categories_url,
                notice: "Event category was successfully destroyed."
  end

  private

  def set_event_category
    @event_category = EventCategory.find(params[:id])
  end

  def event_category_params
    params.require(:event_category).permit(:name)
  end
end
