class Admin::ComandasController < AdminController
  before_action :set_comanda, only: [:show, :edit, :update, :destroy]
  before_action :set_session_comanda, only: [:create]
  # GET /comandas
  # GET /comandas.json
  def index
    if session[:comanda_id]
      @comanda = ComandaItem.where comanda_id: session[:comanda_id]
    else
      flash[:notice] = "Sem produtos no Carrinho"
    end
  end

  # GET /comandas/1
  # GET /comandas/1.json
  def show
  end

  # GET /comandas/new
  def new
    @comanda = Comanda.new
  end

  # GET /comandas/1/edit
  def edit
  end

  # POST /comandas
  # POST /comandas.json
  def create
       if params[:category].present? && params[:category] != "tudo"
      @products = Product.where(category_id: params[:category], establishment_id: params[:establishment_id]).page params[:page]
      @category = @products[0].category.name
    else
      @products = Product.where(establishment_id: params[:establishment_id]).page params[:page]
      @category = "Todos os pratos"
    end
    
    @categories = []
    @products.each do |p| 
    
      @categories << p.category
    
    end

    @categories.uniq!  

      product  = Product.find(params[:product_id])
      
        respond_to do |format|
      if @comanda_item = ComandaItem.create(product_id: params[:product_id], comanda_id: session[:comanda_id])
        flash[:add] = 'Produto Adicionado' 
        format.js  
      else
       # format.html { render :new }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
      end
    #       redirect_to :back, notice: 'Produto Adicionado ao carrinho'     
        #redirect_back(fallback_location:  (request.referer || root_path), notice: 'Produto Adicionado ao carrinho')
     # else
      #     redirect_to :back, notice: 'Falha ao Adicionar ao carrinho'     
            
        #redirect_back(fallback_location:  (request.referer || root_path), notice: 'Erro ao adicionar produto')
      #end
  end

  # PATCH/PUT /comandas/1
  # PATCH/PUT /comandas/1.json
  def update
      if @comanda.update(comanda_params)
        redirect_to [:admin,@comanda], notice: 'Comanda was successfully updated.'
      else
        render :edit
    end
  end

  # DELETE /comandas/1
  # DELETE /comandas/1.json
  def destroy
    @comanda.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to admin_comanda_url, notice: 'Comanda was successfully destroyed.' }
    end
  end

  private

    def set_session_comanda
      @comanda = Comanda.find(session[:comanda_id])
      rescue ActiveRecord::RecordNotFound
        @comanda = Comanda.create(establishment_id: params[:establishment_id])
        session[:comanda_id]=@comanda.id 

    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comanda
      @comanda = Comanda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comanda_params
      params.require(:comanda).permit(:amount, :product_id, :establishment_id)
    end
end
