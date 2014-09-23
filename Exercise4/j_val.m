%return j_val with x,y,theta
function j = j_val( x , y , theta )

m = length(y);

g = inline('1.0 ./ (1.0 + exp(-z))'); 

j = sum(-1*(y.*log(g(x*theta)))-( (ones(m,1) - y ) .* ( log( ones(m,1) - g( x*theta ) ) ) ) )/m;

end
