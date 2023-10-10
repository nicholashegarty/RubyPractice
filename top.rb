require_relative "book"
require_relative "user"
require_relative "library"

book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", 1, "1925", "English")
book2 = Book.new("To Kill a Mockingbird", "Harper Lee", 2, "1960", "English")
book3 = Book.new("1984", "George Orwell", 3, "1949", "English")
book4 = Book.new("One Hundred Years of Solitude", "Gabriel Garcia Marquez", 4, "1967", "Spanish")
book5 = Book.new("Pride and Prejudice", "Jane Austen", 5, "1813", "English")

user1 = User.new("Alice Johnson", "123 Main St, Anytown, USA", 1)
user2 = User.new("Bob Smith", "456 Elm St, Othertown, USA", 2)
user3 = User.new("Eva Davis", "789 Oak St, Anycity, USA", 3)

books_arr = [book1, book2, book3, book4, book5]
user_arr = [user1, user2, user3]
library = Library.new(books_arr, user_arr)

def status(library)
    puts "Here are the available books:"
    library.available_books.each do |b|
        puts "- " + b.title
    end
    puts "Here are the borrowed books and their borrowers"
    library.borrowed.each do |k, v|
        puts "Book: #{k.title}. Borrowed by: #{v.name}"
    end
    puts 
end


def borrow_book(library, book, user)
    #assuses user can borrow one book only at a time
    library.borrowed.each do |k, v|
        if k == book
            puts "Book already borrowed"
            return false
        elsif v == user  
            puts "#{user.name} already borrowing book"
            return false
        else 
            next
        end
    end
    library.borrowed[book] = user
    library.available_books.delete(book)
    puts user.name + " has borrowed " + book.title
end

def return_book(library, arg)
    if library.borrowed.has_key?(arg)
        library.available_books << arg 
        library.borrowed.delete[arg]
        puts "#{arg.title} has been returned."
    elsif library.borrowed.has_value?(arg)    
        library.borrowed.each do |k,v|
            v == arg ? library.available_books << k : next 
            library.borrowed.delete(k)
            puts "#{arg.name} returned #{k.title}."
            break
        end
    else
        puts "Incorrect type of arg, or book not currently borrowed"
    end
end

#     library.borrowed.each do |k, v|
#         if k == arg 
#             puts "book returned"

#         elsif v == arg 
#             puts "user returning"

#         else 
#             puts "don't recognise book or user"
#     end
#     if arg

# end

status(library)
borrow_book(library, book1, user1)

borrow_book(library, book3, user3)
return_book(library, user3)
borrow_book(library, book4, user1)
return_book(library, user1)
borrow_book(library, book4, user1)

status(library)
