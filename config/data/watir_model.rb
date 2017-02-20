class CommentModel < WatirModel
  key(:comment_input) { 'This is a comment' }
end

class SearchModel < WatirModel
  key(:search_input) { 'Watir' }
end
