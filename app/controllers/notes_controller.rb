class NotesController < ApplicationController
  before_action :require_user_logged_in

  def show
    @note = Note.find(params[:id]) 
    @pagy, @comments = pagy(Comment.where(note_id: params[:id]))
    @comment = Comment.new
  end

  def new
#    @user = User.find(params[:id])
#    @user = User.new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = 'ノートを投稿しました。'
      redirect_to note_path
    else
#      @pagy, @notes = pagy(current_user.notes.order(id: :desc))
      flash.now[:danger] = 'ノートの投稿に失敗しました。'
      redirect_to user_path(current_user.id), alert: 'ノートの投稿に失敗しました'
#      redirect_to note_path
#      render :show
#      render template: "users/show"
    end
  end

private
    
  def note_params
    params.require(:note).permit(:subject_id,:status,:note,:user_id)
  end

end
