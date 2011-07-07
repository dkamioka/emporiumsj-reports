class VendasController < ApplicationController

  # GET /vendas
  # GET /vendas.xml
  def index
   todas_vendas = Venda.all(:data_geracao => Date.today - 1..Date.today + 1)
   @custos = Hash.new(0)
   @vendas = Hash.new(0)
   @lucros = Hash.new(0)
    todas_vendas.each do |v|
     data = v.data_geracao.strftime('%d/%m/%Y %H:%M')
     @custos[data] += Dinheiro.new(v.custo)
     @vendas[data] += Dinheiro.new(v.venda)
     @lucros[data] += Dinheiro.new(v.lucro)
   end
  end
end
