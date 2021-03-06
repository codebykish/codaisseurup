class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      events: Event.all
    }.to_json
  end

  def show
    event = Event.find(params[:id])

    render status: 200, json: {
      event: event
    }.to_json
  end

  def create
    event = Event.new(event_params)

    if event.save
      render status: 201, json: {
        message: "Event successfully created",
        event: event
      }.to_json
    else
      render status: 422, json: {
        errors: event.errors
      }.to_json
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render status: 200, json: {
        message: "Event successfully updated",
        event: event
      }.to_json
    else
       render status: 422, json: {
        message: "The event could not be updated",
        errors: event.errors
      }.to_json
    end
  end


  def destroy
    event = Event.find(params[:id])
    event.destroy

    render status: 200, json: {
      message: "Event successfully deleted"
    }.to_json
  end

  private

  def event_params
    params
    .require(:event)
    .permit(
      :name, :description, :location, :price, :capacity, :includes_food, :includes_drink, :starts_at, :ends_at, :active, category_ids: []
    )
  end


end
