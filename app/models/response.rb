# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :respondent_is_not_poll_author

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  # all responses to a question (incl. itself)
  # response, but not yet saved

  def sibling_responses
    self.question
      .responses
      .where(":self_id IS NULL OR responses.id != :self_id", self_id: self.id)
  end

  private

  def respondent_has_not_already_answered_question
    # WHERE responses.user_id = #{self.user_id}
    if sibling_responses.exists?(user_id: self.user_id)
      errors[:base] << "you already answered this question!"
    end
  end

  def respondent_is_not_poll_author
    if self.answer_choice.question.poll.author_id == self.user_id
      errors[:base] << "stop trying to rig the results!"
    end
  end

end






# output for #sibling_responses
# => Response::ActiveRecord_Associations_CollectionProxy

# SELECT  "questions".* FROM "questions" INNER JOIN "answer_choices" ON "questions"."id" = "answer_choices"."question_id" WHERE "answer_choices"."id" = ? LIMIT 1  [["id", 8]]
#   Response Load (0.1ms)  SELECT "responses".* FROM "responses" INNER JOIN "answer_choices" ON "responses"."answer_id" = "answer_choices"."id" WHERE "answer_choices"."question_id" = ?  [["question_id", 4]]
# => [#<Response:0x007f92f68593b0
#   id: 4,
#   user_id: 2,
#   answer_id: 7,
#   created_at: Thu, 07 May 2015 18:54:38 UTC +00:00,
#   updated_at: Thu, 07 May 2015 18:54:38 UTC +00:00>,
#  #<Response:0x007f92f6859130
#   id: 7,
#   user_id: 4,
#   answer_id: 8,
#   created_at: Thu, 07 May 2015 18:59:41 UTC +00:00,
#   updated_at: Thu, 07 May 2015 18:59:41 UTC +00:00>]
