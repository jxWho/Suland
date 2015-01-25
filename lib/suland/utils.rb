# encoding: UTF-8
module Suland

	module Utils
		extend self

		def mergeHashes( origin_hash, override_hash )
			targetHash = origin_hash.dup

			override_hash.each_key do |key|
				if override_hash[ key ].is_a?( Hash ) and
					origin_hash[ key ].is_a?( Hash )

					targetHash[ key ] = Utils.mergeHashes(
						origin_hash[ key ],
						override_hash[ key ] )	
					next
				end # end if

				targetHash[ key ] = override_hash[ key ]
			end

			targetHash
		end # end mergeHashes

	end
end
