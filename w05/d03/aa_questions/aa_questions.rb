require "sqlite3"
require "singleton"

class QuestionDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
  attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        person = QuestionDatabase.instance.execute(<<-SQL, id)

        SELECT
            *
        FROM
            users
        WHERE
            id = ?
    SQL

    User.new(person.first)
    end

    def self.find_by_name(fname, lname)
        name = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? AND lname = ?
        SQL

        User.new(name.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Reply.find_by_question_id(@id)
    end
end

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(id) 
    enquiry = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
    SQL
    Question.new(enquiry.first)
  end
    
  def self.find_by_author_id(author_id)
   author = QuestionDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      questions
    WHERE
      users_id = ?

   SQL

      Question.new(author.first)
  end

  def initialize(options)
      @id = options['id']
      @title = options['title']
      @body = options['body']
      @users_id = options['users_id']
  end

    def author 
        User.find_by_id(@users_id)
    end

    def replies
        Reply.find_by_question_id(@id)
    end
end

class QuestionFollow
  attr_accessor :id, :question_id, :follower_of_question_id

    def self.find_by_id(id)
        follow = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions_follows
        WHERE
            id = ?
        SQL
        QuestionFollow.new(follow.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @followers_of_question_id = options['followers_of_question_id']
    end
end

class Reply
  attr_accessor :id, :subject_question_id, :parent_reply_id, :body

    def self.find_by_id(id)
        answer = QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        Reply.new(answer.first)
    end

    def self.find_by_user_id(user_id)
        user = QuestionDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            replies
        WHERE
            users_id = ?
        SQL

        Reply.new(user.first)
    end

    def self.find_by_question_id(question_id)
        quest = QuestionDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            subject_question_id = ?
        SQL

        Reply.new(quest.first)
    end

    def initialize(options)
        @id = options['id']
        @subject_question_id = options['subject_question_id']
        @parent_reply_id = options['parent_reply_id']
        @users_id = options['users_id']
        @body = options['body']
    end

    def author
        User.find_by_id(@users_id)
    end

    def question
        Question.find_by_author_id(@subject_question_id)
    end

    def parent_reply
        replies = QuestionDatabase.instance.execute(<<-SQL self.parent_reply_id)
        SELECT
            *
        FROM
            replies
        WHERE
            ? = 
        SQL

        Reply.new(replies)
    end

    def child_replies
        replies = QuestionDatabase.instance.execute(<<-SQL, self.id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_reply_id IS NOT NULL
        SQL
    end
end

class QuestionsLike
    attr_accessor :id, :user_likes_id, :question_liked_id

    def self.find_by_id(id)
        like = QuestionDatabase.instance.execute(<<-SQL, id)

        SELECT
            *
        FROM
            questions_likes
        WHERE
            id = ?
        SQL
        QuestionsLike.new(like.first)
    end

    def initialize(options)
        @id = options['id']
        @user_likes_id = options['user_likes_id']
        @question_liked_id = options['uestion_liked_id']
    end
end