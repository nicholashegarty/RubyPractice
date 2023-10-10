class Library

    attr_accessor :books, :available_books, :user, :borrowed
    
    def initialize (books, users)
        @books = books
        @available_books = @books
        @user = users
        @borrowed = Hash.new("This book has not been borrowed")
    end

    
end