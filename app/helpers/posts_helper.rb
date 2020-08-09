module PostsHelper
  def authorized_user_for_post?(user_id)
    user_signed_in? && (user_id == current_user.id)
  end

  def post_action_links(board)
    if authorized_user_for_post?(post.user.id)
      "<td>#{link_to "編輯", edit_post_path(post)}</td>
      <td>#{link_to "刪除", post_path(post), method: 'delete', data: { confirm: '確認刪除?' }}</td>".html.safe
    else
      "<td></td><td></td>".html.safe
    end
  end
end
