class UsersController < ApplicationController
  #before_filter :check_public_access
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :destroy]
  skip_filter :setup

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      if User.all.length > 0
        @user.roles << Role.create(:name => 'admin') #kullanıcıya admin rolü ver
      end
      flash[:notice] = "Hesap kaydedildi!"
      redirect_back_or_default new_collection_path
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Hesap güncellendi!"
      redirect_to account_path
    else
      render :action => :edit
    end
  end

  def destroy
    @user = @current_user
    if @user.destroy
      redirect_to users_path
    else
      redirect_to @user
    end
  end
end
