function m = inverse_colonne( m )
    [x y] = size(m);
    if y < 4
        a = m(:, 1);
        m(:, 1) = m(:, y);
        m(:, y) = a;
    else
        yy = y;
        for i=1:y/2
            a = m(:, i);
            m(:, i) = m(:, yy);
            m(:, yy) = a;
            yy = yy - 1;
        end
    end
end

