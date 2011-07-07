class VendasController < ApplicationController

  # GET /vendas
  # GET /vendas.xml
  def index
   todas_vendas = Venda.all
   @custos = Hash.new(0)
   @vendas = Hash.new(0)
   @lucros = Hash.new(0)
    todas_vendas.each do |v|
     data = v.data_geracao.strftime('%d/%m/%Y %H:%M')
     @custos[data] += v.custo
     @vendas[data] += v.venda
     @lucros[data] += v.lucro
   end
  end
end
