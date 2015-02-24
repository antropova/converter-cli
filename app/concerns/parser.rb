module Parser
  def parse(input)
    case_1 = /^\w{3}$/
    case_2 = /^\d+\s\w{3}$/
    case_3 = /^\d+\s\w{3}\sto\s\w{3}$/
    if input =~ case_1 && rates.countries.keys.include?(input.upcase)
      amount = 1
      initial_cur = input
      result_cur = "usd"
    elsif input =~ case_2 || input =~ case_3
      input_array = input.split(' ')
      amount = input_array[0]
      initial_cur = input_array[1]
      input_array[3] ? result_cur = input_array[3] : result_cur = 'usd'
    else 
      puts Rainbow("Some error occured, please try again").red.bright
      run
    end
    [amount.to_i, initial_cur.upcase, result_cur.upcase]
  end  
end