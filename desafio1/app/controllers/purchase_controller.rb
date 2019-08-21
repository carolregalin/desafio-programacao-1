class PurchaseController < ApplicationController

    def index
    end

    def upload
       purchases = parse_file(params[:purchase_file])

       purchases.each do purchase
            #to - do rotina para salvar
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
                        item: { description: row_purchase[1], price: row_purchase[2] },
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
