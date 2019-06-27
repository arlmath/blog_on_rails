class CommentsController < ApplicationController
    http_basic_authenticate_with name:  "ali",password:"ali",only: :destroy
        
        def index
            @articles = Article.all
        end
       
       
        def create
            @article=Article.find(params[:article_id])
            @comment=@article.comments.create(comment_params)
            if @article.save
            # p "Article2 #{@article.inspect}"
                redirect_to @article
            else
                render articles_ali_path
            end
        end
      
        def destroy
            @article=Article.find(params[:article_id])
            @comment=@article.comments.find(params[:id])
            @comment.destroy
            redirect_to articles_path(@article)
        end
        private
          def comment_params
              params.require(:comment).permit(:commenter, :body)
          end
    
        def new
        end
end
