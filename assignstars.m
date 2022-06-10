%data = readtable('result.csv');
%for k=1:length(data)
    minimumscale = 1;
    currentscale = 1;
    %eps = 1e-6;
    z = cos(3*pi/4);%sqrt(2)/2
    y = sin(3*pi/4)*sin(pi/6);%sqrt(2)/4
    x = sin(3*pi/4)*cos(pi/6);%sqrt(6)/4 = 
    for j=1:length(f)
        A = v(f(j,1),:);
        B = v(f(j,2),:);
        C = v(f(j,3),:);
        n = cross(C-A, B-A);
        a = n(1);
        b = n(2);
        c = n(3);
        d = A(1)*a+A(2)*b+A(3)*c;
        currentscale = d/(a*x + b*y + c*z);
        if currentscale < minimumscale && currentscale > 0
            minimumscale = currentscale;
            %disp(j);
            %p1 = f(j,1)
            %p2 = f(j,2)
            %p3 = f(j,3)

        end
        
    end
    
%end
