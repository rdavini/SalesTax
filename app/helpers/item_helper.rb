module ItemHelper    
    def round_to(num)
        (num * 10**2).round.to_f / 10**2
    end

    module_function :round_to
end