module ApplicationHelper
  def tag_list
    Artifact::TAG_LIST
  end

  def showlines(str)
    str.split(/\n+/i).map{|el| h(el)}.join('<br/>').html_safe
  end
end
