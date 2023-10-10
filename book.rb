class Book
    attr_accessor :title, :author, :unique_id, :date, :language

    def initialize (title, author, unique_id, date, language)
        @title = title
        @author = author
        @unique_id = unique_id
        @date = date
        @language = language
    end
end
