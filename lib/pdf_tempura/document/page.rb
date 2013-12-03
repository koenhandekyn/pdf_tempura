module PdfTempura
  class Document::Page
    include Document::Validation

    def initialize(page_number)
      @number = page_number
      @fields = []

      validate!
    end

    attr_reader :number, :fields

    validates :number, type: Numeric

    def ==(other)
      self.number == other.number
    end

    def field(*args)
      fields << Document::Field::Base.new(*args)
    end

    def data
      @data ||= {}
    end

    def data=(data)
      @data = data.extend(Extensions::Hash::StringifyKeys).stringify_keys!
    end

  end
end