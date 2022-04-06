class Folder < ApplicationRecord
    #acts_as_ferret :fields => [:name]
    #scope :find_with_ferret, -> (name) {where("name like ?", "%#{name}")}
    has_one :metadatum
    has_many :contents

    def self.search_folders se_query
        
        # ph = "Donald Trump's Foreign Policy"
        # searches = Folder.search do
        #     fulltext '*'
        # end

        #searches = self.where("name ~* ?", '(.*)foreign(.*)')
        #searches = self.where("name ~* ?", '.*(Foreign.*America|America.*Foreign).*')
        # stop_words = ['a', 'an', 'the', 'is', 'on', 'in', 'into']
        # phrases = se_query.split(' ')
        #searches = self.where(folder_id: folder_id).order("array_position(array[#{folder_id.join(',')}], folder_id)")

        ###### This code we may want to move it as seperate preprocessing function
        stop_words = ['a', 'an', 'the', 'is', 'on', 'in', 'into', 'of', 'and', 'or']
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
        #######################################################################
        folder_ids = []
        phrases.each do |phrase|
            #search_phrase = phrase + '.*'
            #search_phrase = ' ' + phrase + ' '
            folder_with_phrase = self.where("(folder_title ~* ?) or (folder_title ~* ?) or (folder_title ~* ?)", 
                ' ' + phrase + ' ', phrase + ' ', ' ' + phrase)
            #folder_with_phrase = self.where("folder_title =~ ?", search_phrase)
            # folder_with_phrase = self.where("(folder_title like ?) or (folder_title like ?) or (folder_title like ?)", 
            #     '% ' + phrase + ' %', phrase + ' %', '% ' + phrase)
            folder_with_phrase.each do |search|
                folder_ids.append(search.id)
            end
        end

        folder_ids = folder_ids.inject({}) { |a,e| a[e] = (a[e] || 0) + 1; a}
        folder_ids = folder_ids.sort_by {|k, v| -v}.to_h
        folder_ids = folder_ids.keys
        
        searches = self.where(id:folder_ids).joins(:metadatum)
        searches = folder_ids.collect {|id| searches.detect {|x| x.id == id}}

        return searches

    end

end
