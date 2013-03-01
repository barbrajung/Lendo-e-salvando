# encoding: utf-8
class ArquivoController < ApplicationController

  def index
  end
    
	def upload
    uploaded_io = params[:arqtxt]
    #binding.pry
    if not uploaded_io.blank?
      arq = uploaded_io.read
      #binding.pry
      if arq.blank?
        flash[:notice] = 'O arquivo selecionado encontra-se vazio'
        render :action => 'index'
      else
        total = 0
        valor = 0
        arq.each_line.with_index { |linha, i|
          next if i == 0
          venda = Venda.new
          venda.purchaser_name= URI.unescape(linha.split("\t")[0]).force_encoding('utf-8')
          venda.item_description= URI.unescape(linha.split("\t")[1]).force_encoding('utf-8')
          venda.item_price= URI.unescape(linha.split("\t")[2]).force_encoding('utf-8')
          venda.purchase_count= URI.unescape(linha.split("\t")[3]).force_encoding('utf-8')
          venda.merchant_adress= URI.unescape(linha.split("\t")[4]).force_encoding('utf-8')
          venda.merchant_name= URI.unescape(linha.split("\t")[5]).force_encoding('utf-8')
          venda.save!

          total = total + (linha.split("\t")[2].to_f * linha.split("\t")[3].to_f)
          if (URI.unescape(linha.split("\t")[2]).force_encoding('utf-8') || URI.unescape(linha.split("\t")[3]).force_encoding('utf-8')) == ''
            valor = valor + 1
          end
        }
        binding.pry
        redirect_to vendas_url(:totaldaimportacao => total, :numero => valor)
      end
    else
      flash[:notice] = 'Verifique se o arquivo foi selecionado e clique no botão "Importar"'
      render :action => 'index'
    end
  end
end
