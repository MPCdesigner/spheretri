function [X, Y, a] =  mollweide(vMat,R)               % vMat = [x y z] where x,y,z are vectors. R is the radius

x = vMat(:,1);
y = vMat(:,2);
z = vMat(:,3);

phi   = atan2(y,x);                                % Azimuth
theta = acos(z./sqrt(x.^2 + y.^2 + z.^2));         % Polar angle
eps = 1e-6;
latitude = pi/2 - theta;
for k=1:length(theta)
    if (abs(latitude(k)) > pi/2 - eps)
        a(k,1) = latitude(k);
    else
        f = @(a) 2*a + sin(2*a) - pi*sin(latitude(k)); % phi from Wikipedia = pi/2 - theta. Find the angle "a" such that 2a + sin(2a) = pi*sin(pi/2 - theta)
        a(k,1) = fzero(f,latitude(k));                      % find the angle "a" where the function "f" is 0. Use "a = phi(k)" as the intial guess.
    end
end
