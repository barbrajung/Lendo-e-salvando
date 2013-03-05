# encoding: utf-8
require 'spec_helper'

describe ArquivoController do

  it "deve processar arquivo de entrada" do
    file = File.new(Rails.root + 'app/controllers/dadosentrada.txt')
    subject.stub!(:params).and_return({:arqtxt => file})
    get :upload
    response.should redirect_to(vendas_url(:totaldaimportacao => 95.0, :numero => 0))
  end

  it "deve testar se o arquivo está vazio" do
    file = File.new(Rails.root + 'app/controllers/dadosentradavazio.txt')
    subject.stub!(:params).and_return({:arqtxt => file})
    get :upload
    flash[:notice].should eq "O arquivo selecionado encontra-se vazio."
  end

  it "deve testar se o arquivo não possui o preço do item" do
    file = File.new(Rails.root + 'app/controllers/dadosentradapreco.txt')
    subject.stub!(:params).and_return({:arqtxt => file})
    get :upload
    response.should redirect_to(vendas_url(:totaldaimportacao => 75.0, :numero => 1))
  end

end