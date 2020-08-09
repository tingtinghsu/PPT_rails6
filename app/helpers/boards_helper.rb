module BoardsHelper
  def display_bm(board)
    if board.users.count == 0
      "徵求中"
    else
      board.users.map { |user| user.account }.join(" / ")
    end
  end

  def authorized_user_for_board?(board)
    user_signed_in? && board.users.has_this_id?(current_user.id)
  end

  def board_action_links(board)
    if authorized_user_for_board?(board)
      "<td>#{link_to '編輯', edit_board_path(board)}</td>
      <td>#{link_to '刪除', board_path(board), method: 'delete', data: { confirm: '確認刪除?' }}</td>".html_safe
    else
      "<td></td><td></td>".html_safe
    end
  end
end