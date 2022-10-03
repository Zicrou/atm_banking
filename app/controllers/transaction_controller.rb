class TransactionController < ApplicationController
  before_action :authenticate_user!
  def balance
  end

  def deposit
    #respond_to do |format|
      amount = 0
      if params["transaction"]
        amount = params["transaction"]["amount"].to_d
        @user = current_user
        if @user.account
          account = @user.account
          #card = Card.new
          total_amoun = account.card.amount + amount
          #card.amount = @user.account.card.amount
          Card.where(account_id: account.id).update!(amount: total_amoun)
          redirect_to transaction_deposit_path(), notice: "Deposit Successful!" 
        else
          #format.html { redirect_to transaction_deposit_path(), notice: "You don't have an account." }
        end
      end
      #debugger
    #end
  end

  def withdraw
    
  end
  
  private

  def transaction_params
    params.require(:transaction).permit(:amount)
    
  end
end
