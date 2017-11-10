a = [1, 4, 7, 10, 13]
b = [1, 3, 5, 7, 9]
r = [1, 7]

a = [1, 4, 7]
b = [1, 3, 5, 7, 9]
r = [1, 7]


def compare a, b, i1 = 0, i2
	return nil if a.empty?
	return nil if b.empty?

	e1 = a[0]
	e2 = b[0]

	if e1 == e2
		e1.delete_at(0)
		e2.delete_at(0)
		return e1
	elsif e1 > e2
		b.delete_at(0)
	elsif e1 < e2
		a.delete_at(0)
	end
	return nil
end


r = []
do 
	d = compare a, b
	r.push(d) unless d.nil?

	until a.empty? or b.empty?


