module QuestionsHelper
  def button_text
    if action_name == "new"
      "質問を投稿する"
    elsif action_name == "edit"
      "変更する"
    end
  end
end
