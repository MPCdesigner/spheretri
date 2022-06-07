n=2;R=1;
%[v, f]=icosahedron();
%[v, f]=spheretri(n)
[v, f]=spheretribydepth(3);
[X, Y, indicesOfBadPairs] = mollweide(v,1);
for k=1:length(f)
    for j=1:2
        if indicesOfBadPairs(f(k,j), f(k,j+1)) == 1
            if j == 1
                f(k,1) = nan;
            else 
                f(k,3) = nan;
            end
        end
    end
end
hold('on')
for k=1:length(f)
    if isnan(f(k,1))
        if ~isnan(f(k,3))
            plot(X(f(k,2:3)),Y(f(k,2:3)),'k','LineWidth',3)
        end
    elseif isnan(f(k,3))
        plot(X(f(k,1:2)),Y(f(k,1:2)),'k','LineWidth',3);
    else
        plot(X(f(k,:)),Y(f(k,:)),'k','LineWidth',3);
    end
end
