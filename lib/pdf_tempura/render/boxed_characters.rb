module PdfTempura
  module Render
    class BoxedCharacters
      include OptionAccess
      include FieldBounds

      attr_accessor :field,:value

      def initialize(field, value, options = {})
        @field = field
        @options = options
        @value = value ? value.dup : ""

        validate_value_length!
      end

      def render(pdf)
        characters = value.chars.to_a

        field.fields.each do |field|
          break if characters.empty?
          Field::generate(field, characters.shift, @options).render(pdf)
        end

        render_debug_annotation(pdf) if draw_outlines?
      end

      private

      def validate_value_length!
        if value && !field.truncate? && value.length > field.supported_characters
          raise ArgumentError.new("Data for #{field.name} must be exactly #{field.supported_characters} characters or use the truncate option.")
        end
      end

      def render_debug_annotation(pdf)
        Debug::OutsideAnnotation.new(field).render(pdf)
      end

    end
  end
end
