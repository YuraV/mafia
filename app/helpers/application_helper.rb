module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    if column == sort_column
      css_class = "current #{sort_direction}"
      direction = sort_direction == 'asc' ? 'desc' : 'asc'
    else
      css_class = nil
      direction = 'asc'
    end
    link_to title, params.merge(sort_column: column, sort_direction: direction, page: nil), {class: css_class}
  end

end
