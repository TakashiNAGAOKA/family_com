class CommentsController < ApplicationController
    def new
        
    end

  def create
#   @comment = Comment.find(current_user.family_id)
#    binding.pry

   @comment = Comment.new
   @comment.user_id = current_user.id
   @comment.note_id = params[:id]
   @comment.comment = params[:comment]
   
#    binding.pry

    if (@comment.save)
      flash[:success] = 'コメントを登録しました。'
      redirect_to user_note_path
      
    else
      flash.now[:danger] = 'コメントの登録に失敗しました。'
      redirect_to user_note_path
    end
#   redirect_to user_note_path
  end

    def new
        
    end

end