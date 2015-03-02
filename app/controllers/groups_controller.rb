class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @users = User.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create
  end
  


end
