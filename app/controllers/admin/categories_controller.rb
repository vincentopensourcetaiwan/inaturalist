class Admin::CategoriesController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    authorize Category
    @categories = Category.includes(:observations).order(name: :asc).page params[:page]
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to admin_categories_path, notice: "Category was successfully created."
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category

    @category.destroy

    redirect_to admin_categories_path, notice: "Category was successfully destroyed."

  end


  private

  def category_params
    params.require(:category).permit(:name, :chinese_name)
  end

end