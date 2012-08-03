# coding: utf-8
class UserSessionsController < ApplicationController

  before_filter :authenticate, :only => [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path
    else
      flash[:notice] = 'El correo y contraseña no coinciden'
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to signin_path
  end
end
