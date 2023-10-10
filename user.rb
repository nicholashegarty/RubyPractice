class User
    attr_accessor :name, :address, :unique_id
    def initialize (name, address, unique_id)
        @name = name
        @address = address
        @unique_id = unique_id
    end
end