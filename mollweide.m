function [X, Y] =  mollweide(vMat,R)               % vMat = [x y z] where x,y,z are vectors. R is the radius

x = vMat(:,1);
y = vMat(:,2);
z = vMat(:,3);

phi   = atan(y./x);                                % Azimuth
theta = acos(z./sqrt(x.^2 + y.^2 + z.^2));         % Polar angle

for k=1:length(phi)
    f = @(a) 2*a + sin(2*a) - pi*sin(pi/2-phi(k)); % phi from Wikipedia = pi/2 - theta. Find the angle "a" such that 2a + sin(2a) = pi*sin(pi/2 - theta)
    a(k,1) = fzero(f,phi(k));                      % find the angle "a" where the function "f" is 0. Use "a = phi(k)" as the intial guess.
end

Y = R*sqrt(2)*sin(a);                              % a = the theta in https://en.wikipedia.org/w/index.php?title=Mollweide_projection&oldid=1073635466
X = R*2*sqrt(2)*cos(a).*(1/2-theta/pi);            % lambda = pi/2 - theta, lambda0 = 0. So (lambda - lamdba0)/pi = (1/2 - theta/pi);
