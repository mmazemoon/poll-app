class UserPollQuestionAnswerChoiceResponse < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :user_name, null: false

      t.timestamps
    end

    add_index :users, :user_name, unique: true

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :polls, :title, unique: true

    # looking up rows by column?
    # enforcing uniqueness?
    # then index
    # always index foreign keys

    create_table :questions do |t|
      t.string :text, null: false
      t.integer :poll_id, null: false, index: true

      t.timestamps
    end

    create_table :answer_choices do |t|
      t.string :text, null: false
      t.integer :question_id, null: false, index: true

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id, null: false, index: true
      t.integer :answer_id, null: false, index: true

      t.timestamps
    end
  end
end
