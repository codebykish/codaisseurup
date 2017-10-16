class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
      @bregistration = current_user.registrations.create(registration_params)

      redirect_to @registration.event, notice: "Thank you for registering!"
    end

    def create
        total_price = get_total_price(registration_params)
        @registration = current_user.registrations.create(registration_params.merge(total: total_price))
        redirect_to @registration.event, notice: "Thank you for Registering!"
      end


    private

    def get_total_price(registering_params)
        checkin, checkout = get_dates(registering_params)

        total_days = (checkout - checkin).to_i
        registering_params[:price].to_i * total_days
      end

  def registration_params
     params.require(:registration).permit(:active, :price, :guests_count, :event_id)
   end


end
