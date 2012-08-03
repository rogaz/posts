# coding: utf-8
class PostsController < ApplicationController
  before_filter :authenticate

  def index
    if params[:id]
      @user = User.where(:id => params[:id]).first
      @posts = @user.posts
      @cant_posts = @user.posts.count.to_s
      @posts_de = 'Posts de ' + @user.name + ' (' + @cant_posts + ')'
    else
      @posts = Post.all
      @posts_de = 'Posts'
    end

    respond_to do |format|
      format.html
      format.xml  {render :xml => @posts}
      format.json {render :json => @posts}
    end
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = '¡Post creado!'
      redirect_to root_path
    else
      @posts_de = 'Posts'
      @posts = Post.all
      render 'index'
    end
  end

  def show
    @post_shown = Post.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  {render :xml => @post_shown}
      format.json {render :json => @post_shown}
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:success] = 'Post eliminado!'
    redirect_to root_path
  end
end