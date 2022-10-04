class TransactionController < ApplicationController
  before_action :authenticate_user!
  def balance
  end

  def deposit
    amount = 0
    if params["transaction"]
      amount = params["transaction"]["amount"].to_d
      @user = current_user
      if @user.account
        account = @user.account
        total_amoun = account.card.amount + amount
        Card.where(account_id: account.id).update!(amount: total_amoun)
        redirect_to transaction_deposit_path(), notice: "Deposit Successful!" 
      end
    end
  end

  def withdraw
    #puts "You are in Withdraw Method"
    amount = 0
    if params["transaction"]
      amount = params["transaction"]["amount"].to_d
      @user = current_user
      if @user.account
        account = @user.account
        total_amoun = account.card.amount - amount
        Card.where(account_id: account.id).update!(amount: total_amoun)
        redirect_to transaction_deposit_path(), notice: "Deposit Successful!" 
      end
    end
  end
  
  private

  def transaction_params
    params.require(:transaction).permit(:amount)
    
  end
end
