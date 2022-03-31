

class Folder < ApplicationRecord
    #acts_as_ferret :fields => [:first_name, :last_name]
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

        stop_words = ['a', 'an', 'the', 'is', 'on', 'in', 'into']
        phrases = se_query.split(' ').map{ |x| x.downcase}
        phrases = phrases - stop_words

        folder_ids = []
        phrases.each do |phrase|
            search_phrase = '.*' + phrase + '.*'
            folder_with_phrase = self.where("name ~* ?", search_phrase)
            folder_with_phrase.each do |search|
                folder_ids.append(search.folder_id)
            end
        end

        folder_ids = folder_ids.inject({}) { |a,e| a[e] = (a[e] || 0) + 1; a}
        folder_ids = folder_ids.sort_by {|k, v| -v}.to_h
        folder_ids = folder_ids.keys
        
        searches = self.where(folder_id:folder_ids)
        searches = folder_ids.collect {|id| searches.detect {|x| x.folder_id == id}}

        return searches

    end
end
