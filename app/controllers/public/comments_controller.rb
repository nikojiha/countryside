class Public::CommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post),notice: "コメントを投稿しました。"
    else
    post = Post.find(params[:post_id])
    redirect_to post_path(post),alert: "コメントの投稿に失敗しました。"
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id]),notice: "コメントを削除しました。"
  end
  
   private

  def comment_params
    params.require(:comment).permit(:comment,:post_id)
  end
  
end
