class AnswerThread
  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end
end

answer_threads = [
  AnswerThread.new(1, "aaa"),
  AnswerThread.new(2, "bbb"),
  AnswerThread.new(3, "ccc")
]

puts answer_threads.inspect

# answer_thread_ids = answer_threads.map(&:id)
# puts answer_thread_ids.inspect # [1, 2, 3]

# answer_thread_contents = answer_threads.map(&:content)
# p answer_thread_contents

answer_thread_ids_and_contents = answer_threads.map { |answer_thread| {answer_thread.id => answer_thread.content} }

p answer_thread_ids_and_contents
