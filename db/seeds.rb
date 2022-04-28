# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# folders = [{:folder_id => 1, :name => "Donald Trump's Foreign Policy"},
#            {:folder_id => 2, :name => "President Donald J. Trump's Foreign Policy Puts America First"},
#            {:folder_id => 3, :name => "The Hill: The Memo: Tillerson Flap Puts Spotlight ON TRUMP's FOreign POLICY moves"},
#            {:folder_id => 4, :name => "G20 SUbsidies TOK oil, gas and coal production china"},
#            {:folder_id => 5, :name => "IMI: UZBEKISTAN'S second oil and gas show held"},
#            {:folder_id => 6, :name => "Empty Promises G20 subsidies tol oil, gas and coal production"},
#            {:folder_id => 7, :name => "The Enbridge pipeline tar sands oil spill into the kalamazoo river in michigan"},
#            {:folder_id => 8, :name => "9/15 TRANSCRIPT OF THE ENBRIDGE PIPELINE OIL SPILL HEARING"},
#            {:folder_id => 9, :name => "United nations framework convention on climate change"},
#            {:folder_id => 10, :name => "U.S. views on global climate change"},
#            {:folder_id => 11, :name => "Argentina: A useful partner on climate change"},
#            {:folder_id => 12, :name => "Human rights developments in argentina-"},
#            {:folder_id => 13, :name => "NGO assessment of the human rights requirements in foreign military financing assistance to mexico"},
#            {:folder_id => 14, :name => "Human rights first - guantanamo: A comprehensive exit strategy"},
#            {:folder_id => 15, :name => "Some news updates regarding U.S - Ukraine relations"},
#            {:folder_id => 16, :name => "Some western media updates regarding U.S - Ukraine relations"},
#            {:folder_id => 17, :name => "Latest U.S media reporting on Ukraine"}
# ]

# folders.each do |folder|
#     Folder.create!(folder)
# end

require 'simple_xlsx_reader'
#puts Dir.pwd

workbook = SimpleXlsxReader.open 'db/ScowcroftCollection.xlsx'
worksheets = workbook.sheets
puts "Found #{worksheets.count} worksheets"

worksheets.each do |worksheet|
  puts "Reading: #{worksheet.name}"
  num_rows = 0
  total_rows = worksheet.rows.count
  sample_rows = (1...total_rows).to_a.sample(200, random: Random.new(22))
  #puts sample_rows
  #puts 'end'
  #puts worksheet.rows[3]

  sample_rows.each do |r|
    row_cells = worksheet.rows[r]

    Folder.create!(
        folder_title: row_cells[3]
    )

    Metadatum.create!(
        FOIA_ID: row_cells[0],
        local_id: row_cells[1],
        status: row_cells[2],
        record_collection: row_cells[4],
        office_origin: row_cells[5],
        series: row_cells[6],
        subseries: row_cells[8],
        box_type: row_cells[7],
        box_number: row_cells[10],
        note_field: row_cells[9],
        folder_id: Folder.maximum(:id)
    )
    words = worksheet.rows[r][3].split(' ').map{ |x| x.downcase}
    stripped_words = []
    words.each do |word|
        word.split("'").each do |word_split|
            stripped_words.append(word_split)
        end
    end
        
    hash = Hash.new
    stripped_words.each do |i_key|
        if hash.include?(i_key)
            hash[i_key].append(Folder.maximum(:id))
        else
            f_id = []
            f_id.append(Folder.maximum(:id))
            hash.store(i_key, f_id)
        end
    end


    Content.create!(
        content_path: '/file/' + row_cells[3] + '/sample.pdf',
        metadatum_id: Metadatum.maximum(:id),
        folder_id: Folder.maximum(:id)
    )


    #puts row_cells[3]
  end
  
end
