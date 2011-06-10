require 'spec_helper'

describe EstoquesController do

  def mock_estoque(stubs={})
    (@mock_estoque ||= mock_model(Estoque).as_null_object).tap do |estoque|
      estoque.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all estoques as @estoques" do
      Estoque.stub(:all) { [mock_estoque] }
      get :index
      assigns(:estoques).should eq([mock_estoque])
    end
  end

  describe "GET show" do
    it "assigns the requested estoque as @estoque" do
      Estoque.stub(:get).with("37") { mock_estoque }
      get :show, :id => "37"
      assigns(:estoque).should be(mock_estoque)
    end
  end

  describe "GET new" do
    it "assigns a new estoque as @estoque" do
      Estoque.stub(:new) { mock_estoque }
      get :new
      assigns(:estoque).should be(mock_estoque)
    end
  end

  describe "GET edit" do
    it "assigns the requested estoque as @estoque" do
      Estoque.stub(:get).with("37") { mock_estoque }
      get :edit, :id => "37"
      assigns(:estoque).should be(mock_estoque)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created estoque as @estoque" do
        Estoque.stub(:new).with({'these' => 'params'}) { mock_estoque(:save => true) }
        post :create, :estoque => {'these' => 'params'}
        assigns(:estoque).should be(mock_estoque)
      end

      it "redirects to the created estoque" do
        Estoque.stub(:new) { mock_estoque(:save => true) }
        post :create, :estoque => {}
        response.should redirect_to(estoque_url(mock_estoque))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved estoque as @estoque" do
        Estoque.stub(:new).with({'these' => 'params'}) { mock_estoque(:save => false) }
        post :create, :estoque => {'these' => 'params'}
        assigns(:estoque).should be(mock_estoque)
      end

      it "re-renders the 'new' template" do
        Estoque.stub(:new) { mock_estoque(:save => false) }
        post :create, :estoque => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested estoque" do
        Estoque.should_receive(:get).with("37") { mock_estoque }
        mock_estoque.should_receive(:update).with({'these' => 'params'})
        put :update, :id => "37", :estoque => {'these' => 'params'}
      end

      it "assigns the requested estoque as @estoque" do
        Estoque.stub(:get) { mock_estoque(:update => true) }
        put :update, :id => "1"
        assigns(:estoque).should be(mock_estoque)
      end

      it "redirects to the estoque" do
        Estoque.stub(:get) { mock_estoque(:update => true) }
        put :update, :id => "1"
        response.should redirect_to(estoque_url(mock_estoque))
      end
    end

    describe "with invalid params" do
      it "assigns the estoque as @estoque" do
        Estoque.stub(:get) { mock_estoque(:update => false) }
        put :update, :id => "1"
        assigns(:estoque).should be(mock_estoque)
      end

      it "re-renders the 'edit' template" do
        Estoque.stub(:get) { mock_estoque(:update => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested estoque" do
      Estoque.should_receive(:get).with("37") { mock_estoque }
      mock_estoque.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the estoques list" do
      Estoque.stub(:get) { mock_estoque }
      delete :destroy, :id => "1"
      response.should redirect_to(estoques_url)
    end
  end

end
