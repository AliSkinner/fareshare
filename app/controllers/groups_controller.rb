class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @users = User.all
    @group = Group.new
  end

  def create
    @group=Group.create(group_params)
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end 

  def update
    @group = Group.update(group_params)
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end

end
