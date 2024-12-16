class Question
  attr_reader :answer

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def ask_question
    "What is #{@number1} + #{@number2}?"
  end

  def correct?(input)
    input.to_i == @answer
  end
end
