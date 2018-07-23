class ReservationsController < ApplicationController
    def index
        @reservation = Reservation.includes(:customers).all
    end

    def new
        @customer = Customer.find(params[:customer_id])
        @reservation = Reservation.new
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def create
        @customer = Customer.find(params[:customer_id])
        @reservation = @customer.reservations.new(reservation_params)

        if @reservation.save
            redirect_to @customer
        else
            render 'new'
        end
    end
    
    def edit
        @customer = Customer.find(params[:customer_id])
        @reservation = Reservation.find(params[:id])
    end

    def destroy
        @customer = Customer.find(params[:customer_id])
        @reservation = Reservation.find(params[:id])
        @reservation.destroy

        redirect_to customer_path(@customer)
    end

    private
    def reservation_params
        params.require(:reservation).permit(:date, :reservation_code)
    end

end
