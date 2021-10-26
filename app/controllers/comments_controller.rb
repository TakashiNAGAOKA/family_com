class CommentsController < ApplicationController

  def create

   @comment = Comment.new
   @comment.user_id = current_user.id
   @comment.note_id = params[:id]
   @comment.comment = params[:comment]
   
    if (@comment.save)
      flash[:success] = 'コメントを登録しました。'
      redirect_to user_note_path
      
    else
      flash.now[:danger] = 'コメントの登録に失敗しました。'
      redirect_to user_note_path
    end
  end
end