class CommentsController < ApplicationController
     before_action :set_post

     def create
        @comment= @post.comments.build(comment_params)
     
     if @comment.save
        redirect_to @post, notice: 'Comment was successfully added. '
     
     else
        redirect_to @post, notice: 'Error adding comment.'
     end    
    end
     
     def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy!
        redirect_to @post, notice: 'Comment deleted'
     end

     private

     def set_post
        @post = Post.find(params[:post_id])
     end

     def comment_params
        params.require(:comment).permit(:name, :email, :content)
     end
end
