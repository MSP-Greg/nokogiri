module Nokogiri
  module XML
    module SAX
      class Parser
        attr_accessor :document
        def initialize(doc = XML::SAX::Document.new)
          @document = doc
        end

        ###
        # Parse given +thing+ which may be a string containing xml, or an
        # IO object.
        def parse thing
          thing.is_a?(IO) ? parse_io(thing) : parse_memory(thing)
        end

        ###
        # Parse given +io+
        def parse_io io, encoding = 0
          native_parse_io io, encoding
        end

        ###
        # Parse a file with +filename+
        def parse_file filename
          raise Errno::ENOENT unless File.exists?(filename)
          raise Errno::EISDIR if File.directory?(filename)
          native_parse_file filename
        end
      end
    end
  end
end
