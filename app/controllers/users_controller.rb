class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @auction_bid = AuctionBid.new
    @bought_ticket = BoughtTicket.new
    @event = Event.new
    @ticket = Ticket.new
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address,
                                 :credit_card_number, :credit_card_zip_code, :credit_card_expiration)
  end
end
