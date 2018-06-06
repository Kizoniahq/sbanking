class AccountMailer < ApplicationMailer
  default :from => "support@reylgroup.com"
  def account_email(user, account)
    @user = user
    @account = account
     mail(to: user.email, subject: 'Your Account Has Been Created')
  end
end
