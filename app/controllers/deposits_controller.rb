class DepositsController < InheritedResources::Base

  private

    def deposit_params
      params.require(:deposit).permit(:type, :amount, :status, :depositors_name, :date, :account_id, :user_id)
    end
end

