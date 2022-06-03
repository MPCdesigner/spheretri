n=2;R=1;
[v, f]=icosahedron();
%[v, f]=spheretri(n)
%[v, f]=spheretribydepth(n);
[X, Y]=mollweide(v,R);
hold('on')
for k=1:length(f)
    plot(X(f(k,:)),Y(f(k,:)),'k','LineWidth',3);
end
