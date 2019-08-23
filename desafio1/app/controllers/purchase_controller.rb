class PurchaseController < ApplicationController

    def index
        #listar todos os registros aqui
    end

    def upload
    begin
        if params[:purchase_file].present?
            Purchase::Import.import(params[:purchase_file])

            redirect_to({ action: 'index' }, message: 'Arquivo importado com sucesso =D', gross_total: total)
        else
            raise 'Ooops, você deve selecionar um arquivo para continuar!'
        end
        
    rescue  => e
        debugger
        redirect_to({ action: 'index' },  error: true,  message: e.message)
    end
    end
end
