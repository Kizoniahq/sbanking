class TransferMailer < ApplicationMailer
  default :from => "support@reylgroup.com"
  def transfer_email(user, account, transfer)
    @user = user
    @account = account
    @transfer = transfer
     mail(to: user.email, subject: 'Your Transfer OTP')
  end
end
