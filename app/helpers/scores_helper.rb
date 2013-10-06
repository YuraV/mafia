module ScoresHelper

  def display_standard_table(columns, collection = {})

    thead = content_tag :thead do
      content_tag :tr do
        columns.collect {|column|  concat content_tag(:th,column[:display_name])}.join().html_safe
      end
    end

    tbody = content_tag :tbody do
      collection.collect { |elem|
        content_tag :tr do
          columns.collect { |column|
            concat content_tag(:td, elem.attributes[column[:name]])
          }.to_s.html_safe
        end

      }.join().html_safe
    end

    content_tag :table, thead.concat(tbody), class: 'table table-striped table-bordered bordered zebra'

  end

end
