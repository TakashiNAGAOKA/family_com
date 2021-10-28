class CommentsController < ApplicationController

  def create

   @comment = Comment.new
#    binding.pry
   @comment.user_id = current_user.id
#    binding.pry
   @comment.note_id = params[:comment][:note_id]
#    binding.pry
   @comment.comment = params[:comment][:comment]
#    binding.pry
    
    if (@comment.save)
      flash[:success] = 'コメントを登録しました。'
      redirect_to note_path(@comment.note_id)
    else
      flash.now[:danger] = 'コメントの登録に失敗しました。'
      render note_url(id: @comment.note_id)
    end
  end
end