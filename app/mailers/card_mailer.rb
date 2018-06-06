class CardMailer < ApplicationMailer
  default :from => "support@reylgroup.com"
  def card_email(user, card)
    @user = user
    @card = card
     mail(to: user.email, subject: 'Your card creation in progress')
  end
end
