require 'spec_helper'

describe VendasController do

  def mock_venda(stubs={})
    (@mock_venda ||= mock_model(Venda).as_null_object).tap do |venda|
      venda.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all vendas as @vendas" do
      Venda.stub(:all) { [mock_venda] }
      get :index
      assigns(:vendas).should eq([mock_venda])
    end
  end

  describe "GET show" do
    it "assigns the requested venda as @venda" do
      Venda.stub(:get).with("37") { mock_venda }
      get :show, :id => "37"
      assigns(:venda).should be(mock_venda)
    end
  end

  describe "GET new" do
    it "assigns a new venda as @venda" do
      Venda.stub(:new) { mock_venda }
      get :new
      assigns(:venda).should be(mock_venda)
    end
  end

  describe "GET edit" do
    it "assigns the requested venda as @venda" do
      Venda.stub(:get).with("37") { mock_venda }
      get :edit, :id => "37"
      assigns(:venda).should be(mock_venda)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created venda as @venda" do
        Venda.stub(:new).with({'these' => 'params'}) { mock_venda(:save => true) }
        post :create, :venda => {'these' => 'params'}
        assigns(:venda).should be(mock_venda)
      end

      it "redirects to the created venda" do
        Venda.stub(:new) { mock_venda(:save => true) }
        post :create, :venda => {}
        response.should redirect_to(venda_url(mock_venda))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved venda as @venda" do
        Venda.stub(:new).with({'these' => 'params'}) { mock_venda(:save => false) }
        post :create, :venda => {'these' => 'params'}
        assigns(:venda).should be(mock_venda)
      end

      it "re-renders the 'new' template" do
        Venda.stub(:new) { mock_venda(:save => false) }
        post :create, :venda => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested venda" do
        Venda.should_receive(:get).with("37") { mock_venda }
        mock_venda.should_receive(:update).with({'these' => 'params'})
        put :update, :id => "37", :venda => {'these' => 'params'}
      end

      it "assigns the requested venda as @venda" do
        Venda.stub(:get) { mock_venda(:update => true) }
        put :update, :id => "1"
        assigns(:venda).should be(mock_venda)
      end

      it "redirects to the venda" do
        Venda.stub(:get) { mock_venda(:update => true) }
        put :update, :id => "1"
        response.should redirect_to(venda_url(mock_venda))
      end
    end

    describe "with invalid params" do
      it "assigns the venda as @venda" do
        Venda.stub(:get) { mock_venda(:update => false) }
        put :update, :id => "1"
        assigns(:venda).should be(mock_venda)
      end

      it "re-renders the 'edit' template" do
        Venda.stub(:get) { mock_venda(:update => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested venda" do
      Venda.should_receive(:get).with("37") { mock_venda }
      mock_venda.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vendas list" do
      Venda.stub(:get) { mock_venda }
      delete :destroy, :id => "1"
      response.should redirect_to(vendas_url)
    end
  end

end
