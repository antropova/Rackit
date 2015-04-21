# class SearchSuggestion < ActiveRecord::Base

#   def self.terms_for(prefix)
#     suggestions = Corral.where("location LIKE ?", "%#{prefix}%")
#     suggestions.pluck(:location)
#   end

#   # def self.index_locations
#   #   Corral.find_each do |corral|
#   #     index_term(corral.location)
#   #     corral.location.split.each { |t| index_term(t) }
#   #   end
#   # end

#   # def self.index_term(term)
#   #   Corral.where(term: term.downcase).first_or_initialize.tap do |suggestion|
#   #     suggestion.increment! :popularity
#   #   end
#   # end
# end
