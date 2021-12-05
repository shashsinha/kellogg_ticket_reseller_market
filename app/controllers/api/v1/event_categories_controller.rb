class Api::V1::EventCategoriesController < Api::V1::GraphitiController
  def index
    event_categories = EventCategoryResource.all(params)
    respond_with(event_categories)
  end

  def show
    event_category = EventCategoryResource.find(params)
    respond_with(event_category)
  end

  def create
    event_category = EventCategoryResource.build(params)

    if event_category.save
      render jsonapi: event_category, status: 201
    else
      render jsonapi_errors: event_category
    end
  end

  def update
    event_category = EventCategoryResource.find(params)

    if event_category.update_attributes
      render jsonapi: event_category
    else
      render jsonapi_errors: event_category
    end
  end

  def destroy
    event_category = EventCategoryResource.find(params)

    if event_category.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: event_category
    end
  end
end
