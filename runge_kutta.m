%Runge Kutta Method
function dydt=runge_kutta(t, y, b, miu, beta, alpha, gamma, N, miut, delta, q, c, r, a, b1, b2)

y1=b*N-beta*(y(2)/N)*y(1)-c*y(1)-miu*y(1);
y2=beta*(y(2)/N)*y(1)+c*y(1)+gamma*y(3)-q*gamma*y(3)-miu*y(2)-miut*y(2)-alpha*y(2)-r*y(2)-delta*y(2);
y3=alpha*y(2)+r*y(2)-gamma*y(3)-miu*y(3);
y4=delta*y(2)+q*gamma*y(3)-miu*y(4);

dydt=zeros(4,1);
dydt(1)=lam(1)*(beta*y2/N+c+miu)-lam(2)*(beta*y2/N+c);
dydt(2)=lam(1)*(beta*y1/N)-lam(2)*(beta*y1/N-miu-miut-alpha-r-delta)-lam(3)*(alpha+r)-lam(4)*delta-a;
dydt(3)=lam(3)*(gamma+miu)-lam(2)*(gamma-q*gamma)-lam(4)*q*gamma;
dydt(4)=lam(4)*miu;

end

