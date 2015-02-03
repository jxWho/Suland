# encoding: UTF-8

module Suland
	class Render

		def self.markdown( data, options = {}, locals = {} )
			render :md, data, options, locals
		end

		def self.render( engine, data, options = {}, locals = {}, &block )

			# attr for `Tilt`
			scope = options.delete( :scope ) || Object.new
			file = options.delete( :file )
			line = options.delete( :line ) || 1

			template = Tilt[ engine ]
			raise "Template engine not found: #{engine}" if template.nil?

			# assume here data is either block or string, not file
			case data
			when Proc, String
				body = data.is_a?(String) ? Proc.new { data } : data

				template = template.new( file, line.to_i, options, &body )
			else
				raise ArgumentError, "Sorry, don't know how to render #{ data }"
			end

			# render the template
			out = template.render( scope, locals, &block )
			return out

		end

	end # end class
end
