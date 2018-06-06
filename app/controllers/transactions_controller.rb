class TransactionsController < ApplicationController
layout "accounts"
before_action :authenticate_user!
  def index
    @transfers = Transfer.where(user_id: current_user).order("created_at DESC")
    @deposits = Deposit.where(user_id: current_user).order("created_at DESC")
  end
end
