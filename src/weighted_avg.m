function avg = weighted_avg (w_d, tot_d, w_t, tot_t)
%This function will return the weighted average of two numbers given the
%weights and the numbers.

%w_d is the weight of the price
%tot_d is the total price
%w_t is the weight for the time
%tot_t is the total time.

avg = ((w_d * tot_d) + (w_t * tot_t))/(w_d + w_t);
end
