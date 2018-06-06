class CardsController < InheritedResources::Base
layout "accounts"
  before_action :find_card, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.where(user_id: current_user)
    @accounts = Account.where(user_id: current_user).order('created_at DESC')
    @cards = Card.where(user_id: current_user).order('created_at DESC')
  end

  def show
  end

  def new
    @card = current_user.cards.build
  end
  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      user = User.find_by_id(@card.user_id)
      card = @card
      CardMailer.card_email(user, card).deliver
      redirect_to cards_path, notice: "Card Request Made And In Progress"
    else
    render 'new'
  end
  end

  private
   def find_card
     @card = Card.find(params[:id])
   end
    def card_params
      params.require(:card).permit(:card_type, :pin, :veriy_pin, :card_number, :cvv, :expiry, :card_name, :account_id, :user_id)
    end
end
