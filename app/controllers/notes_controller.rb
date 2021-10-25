class NotesController < ApplicationController
    before_action :require_user_logged_in

    def show
#        binding.pry
#        @user = User.find(params[:user_id])
        @note = Note.find(params[:id]) ##
#        binding.pry
#      @pagy, @note = pagy(Note.find(params[:id]))
#        binding.pry
#        @pagy,@notes = pagy(@notes.order(id: :desc))
#        binding.pry
#      binding.pry
#      notes = Note.all
#      binding.pry
#      comments = Comment.all
#       comments = Comment.where(family_id: current_user.family_id)
#      binding.pry
      # それぞれの複数インスタンスを1つの配列にする
#      @instances = notes | comments
#      binding.pry
      # 作成降順に並び替え
#      @instances.sort!{ |a, b| b.created_at <=> a.created_at }
#      binding.pry
      @pagy, @comments = pagy(Comment.where(note_id: params[:id]))
    end

    def new
        @user = User.find(params[:user_id])
        @note = Note.new
    end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = 'ノートを投稿しました。'
      redirect_to root_url
    else
      @pagy, @notes = pagy(current_user.notes.order(id: :desc))
      flash.now[:danger] = 'ノートの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
    def edit
        
    end

private
    
    def note_params
        params.require(:note).permit(:subject_id,:status,:note,:user_id)
    end

end
