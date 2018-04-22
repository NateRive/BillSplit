class ChargesController < ApplicationController
  before_action :set_group, only: [:create, :show, :update]
  include ApplicationHelper

  def create
    @charge = Charge.new(charge_params)
    if @charge.save
      charged_users = params[:charged_user][:user_id]
      charged_users.each do |charged_user|
        params[:charged_user][:user_id] = charged_user
        @charged_user= ChargedUser.new(charged_user_params)
        unless @charged_user.save
          @charge.destroy
          @charge.charged_users.destroy
          redirect_to group_path(@group), alert: "請求に失敗しました。"
        end
      end
      redirect_to group_path(@group), notice: "請求が完了しました。"
    else
        redirect_to group_path(@group), alert: "何かがおかしいです"
    end
  end


  def show
    @charge = Charge.find_by(id: params[:id], group_id: params[:group_id])
  end


  def update
    change_status(params[:user_id], params[:other_id])
    change_status(params[:other_id], params[:user_id])
    redirect_to group_path(@group), notice: "精算が完了しました。"
  end

  private
  def charge_params
    number_users = params[:charged_user][:user_id].length + 1
    params[:charge][:amount] = params[:charge][:amount].to_i * (number_users - 1) / number_users
    params.require(:charge).permit(:title, :amount).
    merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def charged_user_params
    params.require(:charged_user).permit(:user_id, :status).merge(charge_id: @charge.id)
  end


  def set_group
    @group = Group.find(params[:group_id])
  end
end
