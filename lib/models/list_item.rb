class List_item < ActiveRecord::Base
    belongs_to :List 
    belongs_to :item
end