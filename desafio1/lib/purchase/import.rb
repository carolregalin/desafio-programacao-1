class Purchase::Import
    
    def self.import(file)
        purchases = self.parse_file(file)

        self.total_imported(purchases)
    end

    def self.parse_file(file)
        purchases = []
        first_line = File.open(file.path, &:gets)

        File.open(file.path) do |f|
            #validar se enviou um arquivo vazio aqui
            while line = f.gets
                unless first_line == line
                    row_purchase = line.delete!("\n").split("\t")

                    purchase = {
                        count: row_purchase[3],
                        purchaser: { name: row_purchase[0] },
                        item: { description: row_purchase[1], price: row_purchase[2].to_f },
                        merchant: { address: row_purchase[4], name: row_purchase[5] }
                    }

                    create_purchase(purchase)
                    purchases.push(purchase)
                end
            end
        end
    end

    def self.create_purchase(purchase)
        item = Item.find_or_create_by!(
            description: purchase[:item][:description],
            price: purchase[:item][:price]
        )

        purchaser = Purchaser.find_or_create_by!(name: purchase[:purchaser][:name])

        merchant = Merchant.find_or_create_by!(
            address: purchase[:merchant][:address], 
            name: purchase[:merchant][:name]
        )

        new_purchase = Purchase.new({
                count: purchase.count,
                merchant_id: merchant.id,
                purchaser_id: purchaser.id
        })

        new_purchase.save!
        new_purchase.purchase_items.create(item: item)
    end

    def self.total_imported(purchases)
        purchases.map { |p| p[:item][:price] }.sum
    end
end