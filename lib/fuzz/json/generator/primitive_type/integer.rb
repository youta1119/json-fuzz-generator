module Fuzz
  module JSON
    module Generator
      class PrimitiveType
        class Integer
          class << self
            def invalid_params(attributes)
              generated_params = []
              if type = attributes["type"]
                valid_types = [type].flatten
                generated_params = ["a", "1"] unless valid_types.include?("string")
                Fuzz::JSON::Generator::PrimitiveType.invalid_params_by_type(attributes).each do |invalid_param|
                  generated_params.push(invalid_param)
                end
              else
                generated_params = ["a", "1"]
              end

              generated_params
            end

            def valid_param(attributes = {})
              rand(100)
            end
          end
        end
      end
    end
  end
end

