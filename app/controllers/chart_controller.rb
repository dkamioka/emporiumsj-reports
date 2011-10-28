class ChartController < ApplicationController

  def index
   todas_vendas = Venda.all
   @custos = Hash.new(0)
   @vendas = Hash.new(0)
   @lucros = Hash.new(0)
    todas_vendas.each do |v|
     data = (Time.parse v.controle).strftime('%d/%m/%Y %H')
     @custos[data] += Dinheiro.new(v.custo)
     @vendas[data] += Dinheiro.new(v.venda)
     @lucros[data] += Dinheiro.new(v.lucro)
   end
  end
 
 def show
   data_de = params[:from]
   data_ate = params[:to]
   if !( data_de.nil? and data_ate.nil? ) then
    
     conditions = "date(data_geracao) between '#{data_de}' and '#{data_ate}'"
     groupby = "data"
      
     query = %[
            SELECT 
              data_geracao data
              , sum(custo) custo
              , sum(venda) venda
              , sum(lucro) lucro 
            FROM 
              vendas 
            WHERE 
              #{conditions}  
            GROUP BY 
              #{groupby}
            ]
    else
     groupby = "data"
     
     query = %[
          SELECT
            date(dt) data
            , max(c) custo
            , max(l) lucro
            , max(v) venda
          FROM 
            (select data_geracao dt, sum(custo) c, sum(lucro) l, sum(venda) v from vendas group by dt) a
          GROUP BY
            #{groupby}]    
    end
    
   todas_vendas = DataMapper.repository.adapter.select(query)
    
    @datas = Array.new(0)
    @custos = Array.new(0)
    @vendas = Array.new(0)
    @lucros = Array.new(0)
    
    todas_vendas.each do |v|
      @datas << v.data.strftime('%d/%m/%Y - %H:%M')
      @custos << v.custo.round(2)
      @vendas << v.venda.round(2)
      @lucros << v.lucro.round(2)
    end 

   @h = LazyHighCharts::HighChart.new('graph') do |f|
         f.series(:name=>'Vendas', :data=>@vendas, :stack=>'venda')
         f.series(:name=>'Lucros', :data=>@lucros, :stack=>'custo')
         f.series(:name=>'Custos', :data=>@custos, :stack=>'custo')
         f.series(:name=>'Lucros', :data=>@lucros, :type=>'spline')
         f.x_axis({:categories => [1,2,3,4]})
         f.title( :text => "Vendas de #{@datas.first} a #{@datas.last}" )
         f.chart({:defaultSeriesType=>"column"})
         #f.options[:plotOptions][:column][:stacking] = 'normal'
         f.merge_options
   end
 end

 def showa
     @h = LazyHighCharts::HighChart.new('graph') do |f|
    f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
    f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] )
  end
 end
end
