class EventCategoriesController < ApplicationController
  before_action :set_event_category, only: [:show, :edit, :update, :destroy]

  # GET /event_categories
  def index
    @q = EventCategory.ransack(params[:q])
    @event_categories = @q.result(:distinct => true).includes(:events).page(params[:page]).per(10)
  end

  # GET /event_categories/1
  def show
    @event = Event.new
  end

  # GET /event_categories/new
  def new
    @event_category = EventCategory.new
  end

  # GET /event_categories/1/edit
  def edit
  end

  # POST /event_categories
  def create
    @event_category = EventCategory.new(event_category_params)

    if @event_category.save
      redirect_to @event_category, notice: 'Event category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_categories/1
  def update
    if @event_category.update(event_category_params)
      redirect_to @event_category, notice: 'Event category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /event_categories/1
  def destroy
    @event_category.destroy
    redirect_to event_categories_url, notice: 'Event category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_category
      @event_category = EventCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_category_params
      params.require(:event_category).permit(:name)
    end
end
