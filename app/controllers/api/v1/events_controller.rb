class Api::V1::EventsController < ApplicationController
  before_action :authorize_request
  before_action :set_event, only: [ :show, :update, :destroy ]

  def index
    @events = @current_user.events

    if params[:date].present?
      @events = @events.where(date: params[:date])
    elsif params[:month].present? && params[:year].present?
      start_date = Date.new(params[:year].to_i, params[:month].to_i, 1)
      end_date = start_date.end_of_month
      @events = @events.where(date: start_date..end_date)
    end
    render json: EventBlueprint.render(@events.order(date: :asc))
  end

  def show
    render json: EventBlueprint.render(@event)
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      render json: EventBlueprint.render(@event), status: :created
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: EventBlueprint.render(@event)
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    head :no_content
  end

  private

  def set_event
    @event = @current_user.events.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Event not found" }, status: :not_found
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :category, :priority)
  end
end
