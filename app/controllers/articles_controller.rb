class ArticlesController < ApplicationController 
    before_action :authenticate_user!, only: %i[new create edit update destroy]
    before_action :get_article, only: %i[show edit update destroy]

    def index
        @articles = Article.select(:id, :title, :author, :body, :created_at)
    end

    def show
        
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(permitted_params)
        if !@article.errors.any?
            @article.save
            redirect_to @article, status:422
        else
            render :edit, status:422
        end
    end

    def edit
    end

    def update
        if @article.update(permitted_params)
            redirect_to @article, status:422
        else
            render :edit, status:422
        end
    end

    def destroy
        @article.destroy
        redirect_to root_url
        
    end

    private
    def permitted_params
        params.require(:article).permit(:title, :author, :body)
    end

    def get_article
        @article = Article.find(params[:id])
    end
end