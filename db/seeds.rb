# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([
  { user_name: 'baller1'},
  { user_name: 'baller2'},
  { user_name: 'baller3'},
  { user_name: 'baller4'},
  { user_name: 'baller5'},
  { user_name: 'baller6'},
  ])

Poll.create!([
  { author_id: 1, title: "Poll title #1" },
  { author_id: 2, title: "Poll title #2" },
  { author_id: 3, title: "Poll title #3" },
  { author_id: 4, title: "Poll title #4" },
  { author_id: 5, title: "Poll title #5" },
  { author_id: 6, title: "Poll title #6" },
  ])

Question.create!([
  { poll_id: 1, text: "Question 1 for poll 1" },
  { poll_id: 1, text: "Question 2 for poll 1" },
  { poll_id: 1, text: "Question 3 for poll 1" },

  { poll_id: 2, text: "Question 1 for poll 2" },

  { poll_id: 3, text: "Question 1 for poll 3" },
  { poll_id: 3, text: "Question 2 for poll 3" },
  ])

AnswerChoice.create!([
  { question_id: 1, text: "Answer choice #1" },
  { question_id: 1, text: "Answer choice #2" },

  { question_id: 2, text: "Answer choice #1" },
  { question_id: 2, text: "Answer choice #2" },

  { question_id: 3, text: "Answer choice #1" },
  { question_id: 3, text: "Answer choice #2" },



  { question_id: 4, text: "Answer choice #1" },
  { question_id: 4, text: "Answer choice #2" },



  { question_id: 5, text: "Answer choice #1" },
  { question_id: 5, text: "Answer choice #2" },

  { question_id: 6, text: "Answer choice #1" },
  { question_id: 6, text: "Answer choice #2" },
  ])

Response.create!([
  { user_id: 1, answer_id: 1 },
  { user_id: 1, answer_id: 3 },
  { user_id: 1, answer_id: 5 },

  { user_id: 2, answer_id: 7 },

  { user_id: 3, answer_id: 9 },
  { user_id: 3, answer_id: 11 }
  ])
