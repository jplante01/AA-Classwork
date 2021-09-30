load 'aa_questions.rb'


jeff = User.new('id'=> 1, 'fname' => 'jeffrey', 'lname' => 'plante')
jeff.authored_questions
jeff.authored_replies


Question.find_by_author_id(1)
Question.find_by_author_id(2)
em_q = Question.find_by_author_id(2)
jeff_q = Question.find_by_author_id(1)
jeff_q.author
em_q.replies
jeff_q.replies
jeff_reply = jeff_q.replies
em_reply = em_q.replies
jeff_reply.question
em_reply.question
em_reply.parent_reply

parent = Reply.new('id'=> 3, 'subject_question_id' => 1, 'parent_reply_id' => 1, 'users_id' => 1, 'body' => 'my mom is busy!!!!')
parent.parent_reply
