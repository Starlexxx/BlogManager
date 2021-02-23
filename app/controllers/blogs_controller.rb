# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: %w[new create edit update destroy]

  def index
    @categories = Category.all
    cate = params[:cate]
    @blogs = if !cate.nil?
               Blog.where(category_id: cate)
             else
               Blog.all
             end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    p 'i hate ROR'
    @blog = Blog.find(params[:id])

    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :category_id)
  end
end
