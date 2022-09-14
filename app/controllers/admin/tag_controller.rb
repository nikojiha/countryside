class Admin::TagController < ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
       redirect_to admin_tags_path
    else
      @tags = Tag.all
      render admin_tags_path
    end
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
       redirect_to admin_tags_path
    else
      render edit_admin_tag_path
    end
  end
  
  private
  # ストロングパラメータ
  def tag_params
    params.require(:tag).permit(:name)
  end
  
end
