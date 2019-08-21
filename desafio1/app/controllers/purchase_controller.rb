class PurchaseController < ApplicationController

    def index
    end

    def upload
       if params[:purchase_file].present?
            purchases = parse_file(params[:purchase_file])

            purchases.each do |purchase|
                item = Item.find_or_create_by(description: purchase[:item][:description], price: purchase[:item][:price])

                purchaser = Purchaser.find_or_create_by(name: purchase[:purchaser][:name])

                merchant = Merchant.find_or_create_by(address: purchase[:merchant][:address], name: purchase[:merchant][:name])

                p = Purchase.new({
                    count: purchase.count,
                    merchants_id: merchant.id,
                    purchasers_id: purchaser.id
                })

                p.save

                p.purchase_items.create(item: item)
            end

            gross_total = purchases.map { |p| p[:item][:price] }.sum

            render json: { message: 'Arquivo importado com sucesso =D', gross_total: gross_total }
        else
            render json: { error: 'Ooops, você deve selecionar um arquivo para continuar!' }, status: :not_found
        end
    end

    private

    def parse_file(file)
        purchases = []
        first_line = File.open(file.path, &:gets)

        File.open(file.path) do |f|
            while line = f.gets
                if(not_is_first_line(first_line, line))
                    row_purchase = line.split("\t")
                    purchase = {
                        count: row_purchase[3],
                        purchaser: { name: row_purchase[0] },
                        item: { description: row_purchase[1], price: row_purchase[2].to_f },
                        merchant: { address: row_purchase[4], name: row_purchase[4] }
                    }

                    purchases.push(purchase)
                end
            end
        end

        purchases
    end

    def not_is_first_line(first_line, row)
        first_line != row
    end
end
