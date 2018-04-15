class ChargesController < ApplicationController

  def create
    group = params[:group_id]
    debt_users = params[:charge][:chargeduser_id]
    debt_users.each do |debt_user|
      params[:charge][:chargeduser_id] = debt_user
      Charge.create(create_params)
    end
    redirect_to group_path(group), notice: "請求が完了しました。"
  end

  private
  def create_params
    params.require(:charge).permit(:title, :amount, :group_id, :chargeduser_id).
    merge(user_id: current_user.id)
  end
end
