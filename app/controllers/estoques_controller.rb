class EstoquesController < ApplicationController
  # GET /estoques
  # GET /estoques.xml
  def index
    @estoques = Estoque.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estoques }
    end
  end

  # GET /estoques/1
  # GET /estoques/1.xml
  def show
    @estoque = Estoque.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estoque }
    end
  end

  # GET /estoques/new
  # GET /estoques/new.xml
  def new
    @estoque = Estoque.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estoque }
    end
  end

  # GET /estoques/1/edit
  def edit
    @estoque = Estoque.get(params[:id])
  end

  # POST /estoques
  # POST /estoques.xml
  def create
    @estoque = Estoque.new(params[:estoque])

    respond_to do |format|
      if @estoque.save
        format.html { redirect_to(@estoque, :notice => 'Estoque was successfully created.') }
        format.xml  { render :xml => @estoque, :status => :created, :location => @estoque }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estoque.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estoques/1
  # PUT /estoques/1.xml
  def update
    @estoque = Estoque.get(params[:id])

    respond_to do |format|
      if @estoque.update(params[:estoque])
        format.html { redirect_to(@estoque, :notice => 'Estoque was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estoque.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estoques/1
  # DELETE /estoques/1.xml
  def destroy
    @estoque = Estoque.get(params[:id])
    @estoque.destroy

    respond_to do |format|
      format.html { redirect_to(estoques_url) }
      format.xml  { head :ok }
    end
  end
end
