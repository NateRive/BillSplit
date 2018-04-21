class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]


  def index
    @groups = current_user.groups
  end

  def show
    @charge = Charge.new
    @charges = @group.charges.order("created_at DESC").limit(40)
    @users = @group.users.select{ |user| user != current_user }.to_a.unshift(current_user)
  end


  def search
    @groups = Group.where("name like(?)", "#{params[:keyword]}%")
    @new_groups = @groups.select{ |group| !group.users.ids.include?(current_user.id) }
    # binding.pry
    @member = Member.new
    respond_to do |format|
      format.json
      format.html
    end
  end


  def new
    @group = Group.new
  end


  def edit
  end


  def create
    @group = Group.new(create_params)
      if @group.save
        redirect_to groups_path, notice: 'Group was successfully created.'
      else
        render :new
      end

  end


  def update
    if @group.password == create_params[:password]
      if @group.update(create_params)
        redirect_to groups_path, notice: 'Group was successfully updated.'
      else
        render "new", alert: "something is wrong"
      end
    else
      render "search", alert: "password is wrong"
    end
  end


  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_params
      params.require(:group).permit(:name, :password).merge(user_ids: current_user.id)
    end

    # def update_params
    #   params.permit(:name, :password).merge(user_ids: )
    # end
end
