class MembersController < ApplicationController

  def create
    @group = Group.find(create_params[:group_id])
    # binding.pry
    if create_params[:password] == @group.password
      @member = Member.new(user_id: current_user.id, group_id: create_params[:group_id])
      if @member.save
        redirect_to groups_path, notice: "グループに加入しました"
      end
    else
      # redirect_to  controller: :groups, action: :search, alert: "パスワードが間違っています"
      redirect_to  groups_search_path, alert: "パスワードが間違っています"
    end
  end


  def destroy
    @group =  Member.find_by(group_id: params[:group_id], user_id: params[:id] )
    Member.destroy(@group.id)
    respond_to do |format|
      format.json
      format.html
    end
  end


  private
  def create_params
    params.require(:member).permit(:group_id, :password)
  end
end
