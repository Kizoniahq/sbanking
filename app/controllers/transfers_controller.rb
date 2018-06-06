class TransfersController < ApplicationController
  layout "accounts"
    #before_action :find_Account
    before_action :authenticate_user!
    before_action :find_transfer, except: [:create, :new, :index]

    def index
      @transfers = Transfer.where(user_id: current_user).order("created_at DESC")
    end

    def show
      @otp = @transfer.otps.build

    end

   def new
   end
    def edit
    end



    def create
      @account = Account.friendly.find(params[:account_id])

    @transfer = @account.transfers.create(params[:transfer].permit(:account_number, :routine_number, :amount, :user_id, :account_id, :slug, :tx_id, :transfer_type, :account_pin, :account_name))
       @transfer.user_id = current_user.id
        if @transfer.save
          user = User.find_by_id(@account.user_id)
          account = @account
          transfer = @transfer
          TransferMailer.transfer_email(user, account, transfer).deliver
          redirect_to account_transfer_path(@account, @transfer), notice: "Your OTP has been sent to your email"
        else
          render "new"
        end
    end
    private
    def find_account
      @account = Account.friendly.find(params[:id])
    end
    def find_transfer
      @transfer = Transfer.find(params[:id])
    end
    def transfer_params
      params.require(:transfer).permit(:account_number, :routine_number, :amount, :user_id, :account_id, :otp, :tx_id, :transfer_type, :account_pin, :account_name, :status)
    end

end
