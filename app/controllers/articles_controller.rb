class ArticlesController < ApplicationController
    
    http_basic_authenticate_with name: "ali",password: "admin", except: [:index, :show]
    def ali
    puts "Ali function"    
    @article = Article.new
    end
    
    def index
        @articles = Article.all
    end
    def edit
        @article = Article.find(params[:id])
    end
    def show
        @article = Article.find(params[:id])
    end
    def create
        @article = Article.new(article_params)
        # p "Article## #{@article.inspect}"
        # p "Params :-#{params[:article].inspect}"
        if @article.save
        # p "Article2 #{@article.inspect}"
            redirect_to @article
        else
            render articles_ali_path
        end
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end
    def destroy
        @article=Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    private
      def article_params
          params.require(:article).permit(:name, :text)
      end

    def new
    end
    
end
