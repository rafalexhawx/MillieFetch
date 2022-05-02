class Folder < ApplicationRecord
    has_one :metadatum
    has_many :contents

    def self.search_folders se_query

        ###### This code process the query and extracts all the documents that are relevant to the query
        stop_words = ['a', 'an', 'the', 'is', 'on', 'in', 'into', 'of', 'and', 'or', 'for']
        words = se_query.split(' ').map{ |x| x.downcase}
        #words = se_query.split(' ')
        stripped_words = []
        words.each do |word|
            word.split("'").each do |word_split|
                stripped_words.append(word_split)
            end
        end

        phrases = []
        stripped_words.each do |stripped_word|
            if stripped_word.length > 1
                phrases.append(stripped_word)
            end
        end

        phrases = phrases - stop_words
        #### perform regex search on the folder titles
        folder_ids = []
        phrases.each do |phrase|
            folder_with_phrase = self.where("(folder_title ~* ?) or (folder_title ~* ?) or (folder_title ~* ?)", 
                ' ' + phrase + ' ', phrase + ' ', ' ' + phrase)

            folder_with_phrase.each do |search|
                folder_ids.append(search.id)
            end
        end

        #### sort the id of folders based on the high word hit
        folder_ids = folder_ids.inject({}) { |a,e| a[e] = (a[e] || 0) + 1; a}
        folder_ids = folder_ids.sort_by {|k, v| -v}.to_h
        folder_ids = folder_ids.keys
        
        searches = self.where(id:folder_ids).joins(:metadatum)
        searches = searches.where(id:folder_ids).joins(:contents)
        searches = folder_ids.collect {|id| searches.detect {|x| x.id == id}}

        return searches

    end

end
