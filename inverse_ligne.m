function m = inverse_ligne( m )
    [x y] = size(m);
    if x < 4
        a = m(1, :);
        m(1, :) = m(x, :);
        m(x, :) = a;
    else
        xx = x;
        for i=1:x/2
            a = m(i, :);
            m(i, :) = m(xx, :);
            m(xx, :) = a;
            xx = xx - 1;
        end
    end
end

