//
//  MixedContentLink.swift
//  Redford
//
//  Created by Igor Marcossi on 21/11/23.
//

import SwiftUI
import Defaults

struct MixedContentLink: View, Equatable {
  static func == (lhs: MixedContentLink, rhs: MixedContentLink) -> Bool {
    lhs.content == rhs.content && lhs.theme == rhs.theme
  }
  
  var content: Either<Post, Comment>
  var theme: SubPostsListTheme
  
  @Default(.PostLinkDefSettings) private var postLinkDefSettings
  @Default(.CommentLinkDefSettings) private var commentLinkDefSettings
  @Environment(\.contentWidth) private var contentWidth
  
  var body: some View {
    switch content {
    case .first(let post):
      if let RedfordData = post.RedfordData, let postSub = RedfordData.subreddit {
        PostLink(id: post.id, theme: theme, showSub: true, compactPerSubreddit: nil, contentWidth: contentWidth, defSettings: postLinkDefSettings)
        .environmentObject(post)
        .environmentObject(postSub)
        .environmentObject(RedfordData)
      }
    case .second(let comment):
      VStack {
        ShortCommentPostLink(comment: comment)
          .padding()
        if let commentRedfordData = comment.RedfordData {
          CommentLink(showReplies: false, comment: comment, commentRedfordData: commentRedfordData, children: comment.childrenRedford)
        }
      }
      .background(PostLinkBG(theme: theme, stickied: false, secondary: false).equatable())
      .mask(RR(theme.theme.cornerRadius, Color.black).equatable())
    }
  }
}
