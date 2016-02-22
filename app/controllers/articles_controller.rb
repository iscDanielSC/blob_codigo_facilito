class ArticlesController< ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]

  # GET /articles
  def index
  	@articles = Article.all
  end

  #GET /articles/:id
  def show
    @article.update_visits_count
    @comment = @article.comments.new
  end

  #GET /articles/new
  def new
  	@article = Article.new
  end

 #POST /arcticles 
  def create
  	@article = current_user.articles.new(article_params)
  	if @article.save
  		redirect_to @article
  	else
  		render :new
  	end
  end
  
  #GET /articles/:id
  def edit

  end

  #DELETE /articles/:id
  def destroy
  	@article.destroy #Elimina objetos de la BD
  	redirect_to articles_path
  end

  def update    
    if @article.update(article_params)
      redirect_to @article  
    else
      render :edit
    end  
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)    
  end

  def set_article
    @article = Article.find(params[:id]) 
  end
end
