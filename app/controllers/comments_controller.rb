class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board
    else
      # rails5.1以降
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full_messages
      redirect_back fallback_location: comment.board

    # Rails5系  
    #   redirect_to :back, flash: {
    #     comment: comment,
    #     error_messages: comment.errors   
    #   }
    end
    
  end

  def destroy
  comment = Comment.find(param[:id])
  comment.delete
  redirect_to comment.board, flash: { 'notice': 'コメントが削除されました'}
  end

  private 

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment )
  end
  
end
