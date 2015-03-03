class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.new
    respond_to do |format|
      format.html
      format.json {render json: @groups}
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @users=params[:user][:user_ids]
    @users.each do |user|
      @group.users << User.find(user)
    end
    render json: @group, status: :created
    # redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end 

  def update
    @group = Group.update(group_params)
    redirect_to groups_path
  end

  # def show
  #   @group = Group.find(params[:id])
  # end

  private
  def group_params
    params.require(:group).permit(:name, :description, {user_ids:[]})
  end

end
