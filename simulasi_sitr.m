function y=simulasi_sitr(b, miu, beta, alpha, gamma, N, miut, delta, q,  S0, I0, T0, R0, tf, a, b1, b2)
M=100;
t=linspace(0,tf,M+1);
h=tf/M;
h2=h/2;

S=zeros(1,M+1);
I=zeros(1,M+1);
T=zeros(1,M+1);
R=zeros(1,M+1);

S1=zeros(1,M+1);
I1=zeros(1,M+1);
T1=zeros(1,M+1);
R1=zeros(1,M+1);

S(1)=S0;
I(1)=I0;
T(1)=T0;
R(1)=R0;

S1(1)=S0;
I1(1)=I0;
T1(1)=T0;
R1(1)=R0;

lambda1=ones(1,M+1);
lambda2=ones(1,M+1);
lambda3=ones(1,M+1);
lambda4=ones(1,M+1);

% lambda1=zeros(1,M+1);
% lambda2=zeros(1,M+1);
% lambda3=zeros(1,M+1);
% lambda4=zeros(1,M+1);

c=zeros(1,M+1);
r=zeros(1,M+1);

kk=0;
    for i=1:M
    oldc=c;
    oldr=r;

    kk=kk+1;
    fprintf('iterasi ke : %i \n ', kk);
    %program dengan kontrol
     for i=1:M
        k1S=h*(b*N-beta*(I(i)/N)*S(i)-c(i)*S(i)-miu*S(i));
        k1I=h*(beta*(I(i)/N)*S(i)+c(i)*S(i)+gamma*T(i)-q*gamma*T(i)-miu*I(i)-miut*I(i)-alpha*I(i)-r(i)*I(i)-delta*I(i));
        k1T=h*(alpha*I(i)+r(i)*I(i)-gamma*T(i)-miu*T(i));
        k1R=h*(delta*I(i)+q*gamma*T(i)-miu*R(i));
        k2S=h*(b*N-beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)-c(i)*(S(i)+h2*k1S)-miu*(S(i)+h2*k1S));
        k2I=h*(beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)+c(i)*(S(i)+h2*k1S)+gamma*(T(i)+h2*k1T)-q*gamma*(T(i)+h2*k1T)-miu*(I(i)+h2*k1I)-miut*(I(i)+h2*k1I)-alpha*(I(i)+h2*k1I)-r(i)*(I(i)+h2*k1I)-delta*(I(i)+h2*k1I));
        k2T=h*(alpha*(I(i)+h2*k1I)+r(i)*(I(i)+h2*k1I)-gamma*(T(i)+h2*k1T)-miu*(T(i)+h2*k1T));
        k2R=h*(delta*(I(i)+h2*k1I)+q*gamma*(T(i)+h2*k1T)-miu*(R(i)+h2*k1R));
        k3S=h*(b*N-beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)-c(i)*(S(i)+h2*k2S)-miu*(S(i)+h2*k2S));
        k3I=h*(beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)+c(i)*(S(i)+h2*k2S)+gamma*(T(i)+h2*k2T)-q*gamma*(T(i)+h2*k2T)-miu*(I(i)+h2*k2I)-miut*(I(i)+h2*k2I)-alpha*(I(i)+h2*k2I)-r(i)*(I(i)+h2*k2I)-delta*(I(i)+h2*k2I));
        k3T=h*(alpha*(I(i)+h2*k2I)+r(i)*(I(i)+h2*k2I)-gamma*(T(i)+h2*k2T)-miu*(T(i)+h2*k2T));
        k3R=h*(delta*(I(i)+h2*k2I)+q*gamma*(T(i)+h2*k2T)-miu*(R(i)+h2*k2R));
        k4S=h*(b*N-beta*((I(i)+h*k3I)/N)*(S(i)+h*k3S)-c(i)*(S(i)+h*k3S)-miu*(S(i)+h*k3S));
        k4I=h*(beta*(I(i)+h*k3I)/N*(S(i)+h*k3S)+c(i)*(S(i)+h*k3S)+gamma*(T(i)+h*k3T)-q*gamma*(T(i)+h*k3T)-miu*(I(i)+h*k3I)-miut*(I(i)+h*k3I)-alpha*(I(i)+h*k3I)-r(i)*(I(i)+h*k3I)-delta*(I(i)+h*k3I));
        k4T=h*(alpha*(I(i)+h*k3I)+r(i)*(I(i)+h*k3I)-gamma*(T(i)+h*k3T)-miu*(T(i)+h*k3T));
        k4R=h*(delta*(I(i)+h*k3I)+q*gamma*(T(i)+h*k3T)-miu*(R(i)+h*k3R));

%control vaksin di awal
%         k1S=h*(b*N-beta*(I(i)/N)*S(i)+c(i)*N-miu*S(i));
%         k1I=h*(beta*(I(i)/N)*S(i)+gamma*T(i)-q*gamma*T(i)-miu*I(i)-miut*I(i)-alpha*I(i)-r(i)*I(i)-delta*I(i));
%         k1T=h*(alpha*I(i)+r(i)*I(i)-gamma*T(i)-miu*T(i));
%         k1R=h*(delta*I(i)+q*gamma*T(i)-miu*R(i));
%         k2S=h*(b*N-beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)+c(i)*N-miu*(S(i)+h2*k1S));
%         k2I=h*(beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)+gamma*(T(i)+h2*k1T)-q*gamma*(T(i)+h2*k1T)-miu*(I(i)+h2*k1I)-miut*(I(i)+h2*k1I)-alpha*(I(i)+h2*k1I)-r(i)*(I(i)+h2*k1I)-delta*(I(i)+h2*k1I));
%         k2T=h*(alpha*(I(i)+h2*k1I)+r(i)*(I(i)+h2*k1I)-gamma*(T(i)+h2*k1T)-miu*(T(i)+h2*k1T));
%         k2R=h*(delta*(I(i)+h2*k1I)+q*gamma*(T(i)+h2*k1T)-miu*(R(i)+h2*k1R));
%         k3S=h*(b*N-beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)+c(i)*N-miu*(S(i)+h2*k2S));
%         k3I=h*(beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)+gamma*(T(i)+h2*k2T)-q*gamma*(T(i)+h2*k2T)-miu*(I(i)+h2*k2I)-miut*(I(i)+h2*k2I)-alpha*(I(i)+h2*k2I)-r(i)*(I(i)+h2*k2I)-delta*(I(i)+h2*k2I));
%         k3T=h*(alpha*(I(i)+h2*k2I)+r(i)*(I(i)+h2*k2I)-gamma*(T(i)+h2*k2T)-miu*(T(i)+h2*k2T));
%         k3R=h*(delta*(I(i)+h2*k2I)+q*gamma*(T(i)+h2*k2T)-miu*(R(i)+h2*k2R));
%         k4S=h*(b*N-beta*((I(i)+h*k3I)/N)*(S(i)+h*k3S)+c(i)*N-miu*(S(i)+h*k3S));
%         k4I=h*(beta*(I(i)+h*k3I)/N*(S(i)+h*k3S)+gamma*(T(i)+h*k3T)-q*gamma*(T(i)+h*k3T)-miu*(I(i)+h*k3I)-miut*(I(i)+h*k3I)-alpha*(I(i)+h*k3I)-r(i)*(I(i)+h*k3I)-delta*(I(i)+h*k3I));
%         k4T=h*(alpha*(I(i)+h*k3I)+r(i)*(I(i)+h*k3I)-gamma*(T(i)+h*k3T)-miu*(T(i)+h*k3T));
%         k4R=h*(delta*(I(i)+h*k3I)+q*gamma*(T(i)+h*k3T)-miu*(R(i)+h*k3R));

%control vaksin saja
%         k1S=h*(b*N-beta*(I(i)/N)*S(i)-c(i)*S(i)-miu*S(i));
%         k1I=h*(beta*(I(i)/N)*S(i)+c(i)*S(i)+gamma*T(i)-q*gamma*T(i)-miu*I(i)-miut*I(i)-alpha*I(i)-delta*I(i));
%         k1T=h*(alpha*I(i)-gamma*T(i)-miu*T(i));
%         k1R=h*(delta*I(i)+q*gamma*T(i)-miu*R(i));
%         k2S=h*(b*N-beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)-c(i)*(S(i)+h2*k1S)-miu*(S(i)+h2*k1S));
%         k2I=h*(beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)+c(i)*(S(i)+h2*k1S)+gamma*(T(i)+h2*k1T)-q*gamma*(T(i)+h2*k1T)-miu*(I(i)+h2*k1I)-miut*(I(i)+h2*k1I)-alpha*(I(i)+h2*k1I)-delta*(I(i)+h2*k1I));
%         k2T=h*(alpha*(I(i)+h2*k1I)-gamma*(T(i)+h2*k1T)-miu*(T(i)+h2*k1T));
%         k2R=h*(delta*(I(i)+h2*k1I)+q*gamma*(T(i)+h2*k1T)-miu*(R(i)+h2*k1R));
%         k3S=h*(b*N-beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)-c(i)*(S(i)+h2*k2S)-miu*(S(i)+h2*k2S));
%         k3I=h*(beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)+c(i)*(S(i)+h2*k2S)+gamma*(T(i)+h2*k2T)-q*gamma*(T(i)+h2*k2T)-miu*(I(i)+h2*k2I)-miut*(I(i)+h2*k2I)-alpha*(I(i)+h2*k2I)-delta*(I(i)+h2*k2I));
%         k3T=h*(alpha*(I(i)+h2*k2I)-gamma*(T(i)+h2*k2T)-miu*(T(i)+h2*k2T));
%         k3R=h*(delta*(I(i)+h2*k2I)+q*gamma*(T(i)+h2*k2T)-miu*(R(i)+h2*k2R));
%         k4S=h*(b*N-beta*((I(i)+h*k3I)/N)*(S(i)+h*k3S)-c(i)*(S(i)+h*k3S)-miu*(S(i)+h*k3S));
%         k4I=h*(beta*(I(i)+h*k3I)/N*(S(i)+h*k3S)+c(i)*(S(i)+h*k3S)+gamma*(T(i)+h*k3T)-q*gamma*(T(i)+h*k3T)-miu*(I(i)+h*k3I)-miut*(I(i)+h*k3I)-alpha*(I(i)+h*k3I)-delta*(I(i)+h*k3I));
%         k4T=h*(alpha*(I(i)+h*k3I)-gamma*(T(i)+h*k3T)-miu*(T(i)+h*k3T));
%         k4R=h*(delta*(I(i)+h*k3I)+q*gamma*(T(i)+h*k3T)-miu*(R(i)+h*k3R));
% %         
%         %control terapi saja
%         k1S=h*(b*N-beta*(I(i)/N)*S(i)-miu*S(i));
%         k1I=h*(beta*(I(i)/N)*S(i)+gamma*T(i)-q*gamma*T(i)-miu*I(i)-miut*I(i)-alpha*I(i)-r(i)*I(i)-delta*I(i));
%         k1T=h*(alpha*I(i)+r(i)*I(i)-gamma*T(i)-miu*T(i));
%         k1R=h*(delta*I(i)+q*gamma*T(i)-miu*R(i));
%         k2S=h*(b*N-beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)-miu*(S(i)+h2*k1S));
%         k2I=h*(beta*((I(i)+h2*k1I)/N)*(S(i)+h2*k1S)+gamma*(T(i)+h2*k1T)-q*gamma*(T(i)+h2*k1T)-miu*(I(i)+h2*k1I)-miut*(I(i)+h2*k1I)-alpha*(I(i)+h2*k1I)-r(i)*(I(i)+h2*k1I)-delta*(I(i)+h2*k1I));
%         k2T=h*(alpha*(I(i)+h2*k1I)+r(i)*(I(i)+h2*k1I)-gamma*(T(i)+h2*k1T)-miu*(T(i)+h2*k1T));
%         k2R=h*(delta*(I(i)+h2*k1I)+q*gamma*(T(i)+h2*k1T)-miu*(R(i)+h2*k1R));
%         k3S=h*(b*N-beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)-miu*(S(i)+h2*k2S));
%         k3I=h*(beta*((I(i)+h2*k2I)/N)*(S(i)+h2*k2S)+gamma*(T(i)+h2*k2T)-q*gamma*(T(i)+h2*k2T)-miu*(I(i)+h2*k2I)-miut*(I(i)+h2*k2I)-alpha*(I(i)+h2*k2I)-r(i)*(I(i)+h2*k2I)-delta*(I(i)+h2*k2I));
%         k3T=h*(alpha*(I(i)+h2*k2I)+r(i)*(I(i)+h2*k2I)-gamma*(T(i)+h2*k2T)-miu*(T(i)+h2*k2T));
%         k3R=h*(delta*(I(i)+h2*k2I)+q*gamma*(T(i)+h2*k2T)-miu*(R(i)+h2*k2R));
%         k4S=h*(b*N-beta*((I(i)+h*k3I)/N)*(S(i)+h*k3S)-miu*(S(i)+h*k3S));
%         k4I=h*(beta*(I(i)+h*k3I)/N*(S(i)+h*k3S)+gamma*(T(i)+h*k3T)-q*gamma*(T(i)+h*k3T)-miu*(I(i)+h*k3I)-miut*(I(i)+h*k3I)-alpha*(I(i)+h*k3I)-r(i)*(I(i)+h*k3I)-delta*(I(i)+h*k3I));
%         k4T=h*(alpha*(I(i)+h*k3I)+r(i)*(I(i)+h*k3I)-gamma*(T(i)+h*k3T)-miu*(T(i)+h*k3T));
%         k4R=h*(delta*(I(i)+h*k3I)+q*gamma*(T(i)+h*k3T)-miu*(R(i)+h*k3R));

        aa=(k1S+2*k2S+2*k3S+k4S)/6;
        bb=(k1I+2*k2I+2*k3I+k4I)/6;
        cc=(k1T+2*k2T+2*k3T+k4T)/6;
        dd=(k1R+2*k2R+2*k3R+k4R)/6;
        
        S(i+1)=S(i)+aa;
        I(i+1)=I(i)+bb;
        T(i+1)=T(i)+cc;
        R(i+1)=R(i)+dd;
     end
    
     %program tanpa kontrol
      for i=1:M
        k1S1=h*(b*N-beta*(I1(i)/N)*S1(i)-miu*S1(i));
        k1I1=h*(beta*(I1(i)/N)*S1(i)+gamma*T1(i)-q*gamma*T1(i)-miu*I1(i)-miut*I1(i)-alpha*I1(i)-delta*I1(i));
        k1T1=h*(alpha*I1(i)-gamma*T1(i)-miu*T1(i));
        k1R1=h*(delta*I1(i)+q*gamma*T1(i)-miu*R1(i));
        k2S1=h*(b*N-beta*((I1(i)+h2*k1I1)/N)*(S1(i)+h2*k1S1)-miu*(S1(i)+h2*k1S1));
        k2I1=h*(beta*((I1(i)+h2*k1I1)/N)*(S1(i)+h2*k1S1)+gamma*(T1(i)+h2*k1T1)-q*gamma*(T1(i)+h2*k1T1)-miu*(I1(i)+h2*k1I1)-miut*(I1(i)+h2*k1I1)-alpha*(I1(i)+h2*k1I1)-delta*(I1(i)+h2*k1I1));
        k2T1=h*(alpha*(I1(i)+h2*k1I1)-gamma*(T1(i)+h2*k1T1)-miu*(T1(i)+h2*k1T1));
        k2R1=h*(delta*(I1(i)+h2*k1I1)+q*gamma*(T1(i)+h2*k1T1)-miu*(R1(i)+h2*k1R1));
        k3S1=h*(b*N-beta*((I1(i)+h2*k2I1)/N)*(S1(i)+h2*k2S1)-miu*(S1(i)+h2*k2S1));
        k3I1=h*(beta*((I1(i)+h2*k2I1)/N)*(S1(i)+h2*k2S1)+gamma*(T1(i)+h2*k2T1)-q*gamma*(T1(i)+h2*k2T1)-miu*(I1(i)+h2*k2I1)-miut*(I1(i)+h2*k2I1)-alpha*(I1(i)+h2*k2I1)-delta*(I1(i)+h2*k2I1));
        k3T1=h*(alpha*(I1(i)+h2*k2I1)-gamma*(T1(i)+h2*k2T1)-miu*(T1(i)+h2*k2T1));
        k3R1=h*(delta*(I1(i)+h2*k2I1)+q*gamma*(T1(i)+h2*k2T1)-miu*(R1(i)+h2*k2R1));
        k4S1=h*(b*N-beta*((I1(i)+h*k3I1)/N)*(S1(i)+h*k3S1)-miu*(S1(i)+h*k3S1));
        k4I1=h*(beta*((I1(i)+h*k3I1)/N)*(S1(i)+h*k3S1)+gamma*(T1(i)+h*k3T1)-q*gamma*(T1(i)+h*k3T1)-miu*(I1(i)+h*k3I1)-miut*(I1(i)+h*k3I1)-alpha*(I1(i)+h*k3I1)-delta*(I1(i)+h*k3I1));
        k4T1=h*(alpha*(I1(i)+h*k3I1)-gamma*(T1(i)+h*k3T1)-miu*(T1(i)+h*k3T1));
        k4R1=h*(delta*(I1(i)+h*k3I1)+q*gamma*(T1(i)+h*k3T1)-miu*(R1(i)+h*k3R1));
        
        aa1=(k1S1+2*k2S1+2*k3S1+k4S1)/6;
        bb1=(k1I1+2*k2I1+2*k3I1+k4I1)/6;
        cc1=(k1T1+2*k2T1+2*k3T1+k4T1)/6;
        dd1=(k1R1+2*k2R1+2*k3R1+k4R1)/6;
        
        S1(i+1)=S1(i)+aa1;
        I1(i+1)=I1(i)+bb1;
        T1(i+1)=T1(i)+cc1;
        R1(i+1)=R1(i)+dd1;
      end
      
     for i=1:M
        j=(M+2)-i;
        
%         k1lambda1=h*(lambda1(j+1)*(beta*(I1(j+1)/N)+c(i)+miu)-lambda2(j+1)*(beta*(I1(j+1)/N)+c(i)));
%         k1lambda2=h*(a+lambda1(j+1)*beta*(S1(j+1)/N)-lambda2(j+1)*(beta*(S1(j+1)/N)-miu*I1(j+1)-miut*I1(j+1)-alpha*I1(j+1)-r(i)*I1(j+1)-delta*I1(j+1))-lambda3(j+1)*(alpha+r(i))*I1(j+1)-lambda4(j+1)*delta*I1(j+1));
%         k1lambda3=h*(lambda2(j+1)*(q*gamma-gamma)+lambda3(j+1)*(gamma+miu)-lambda4(j+1)*q*gamma*T1(j+1));
%         k1lambda4=h*(lambda4(j+1)*miu);
%         k2lambda1=h*((lambda1(j+1)+h2*k1lambda1)*(beta*(I1(j+1)/N)+c(i)+miu)-(lambda2(j+1)+h2*k1lambda2)*(beta*(I1(j+1)/N)+c(i)));
%         k2lambda2=h*(a+(lambda1(j+1)+h2*k1lambda1)*beta*(S1(j+1)/N)-(lambda2(j+1)+h2*k1lambda2)*(beta*(S1(j+1)/N)-miu*I1(j+1)-miut*I1(j+1)-alpha*I1(j+1)-r(i)*I1(j+1)-delta*I1(j+1))-(lambda3(j+1)+h2*k1lambda3)*(alpha+r(i))*I1(j+1)-(lambda4(j+1)+h2*k1lambda4)*delta*I1(j+1));
%         k2lambda3=h*((lambda2(j+1)+h2*k1lambda2)*(q*gamma-gamma)+(lambda3(j+1)+h2*k1lambda3)*(gamma+miu)-(lambda4(j+1)+h2*k1lambda4)*q*gamma*T1(j+1));
%         k2lambda4=h*((lambda4(j+1)+h2*k1lambda4)*miu);
%         k3lambda1=h*((lambda1(j+1)+h2*k2lambda1)*(beta*(I1(j+1)/N)+c(i)+miu)-(lambda2(j+1)+h2*k2lambda2)*(beta*(I1(j+1)/N)+c(i)));
%         k3lambda2=h*(a+(lambda1(j+1)+h2*k2lambda1)*beta*(S1(j+1)/N)-(lambda2(j+1)+h2*k2lambda2)*(beta*(S1(j+1)/N)-miu*I1(j+1)-miut*I1(j+1)-alpha*I1(j+1)-r(i)*I1(j+1)-delta*I1(j+1))-(lambda3(j+1)+h2*k2lambda3)*(alpha+r(i))*I1(j+1)-(lambda4(j+1)+h2*k2lambda4)*delta*I1(j+1));
%         k3lambda3=h*((lambda2(j+1)+h2*k2lambda2)*(q*gamma-gamma)+(lambda3(j+1)+h2*k2lambda3)*(gamma+miu)-(lambda4(j+1)+h2*k2lambda4)*q*gamma*T1(j+1));
%         k3lambda4=h*((lambda4(j+1)+h2*k2lambda4)*miu);
%         k4lambda1=h*((lambda1(j+1)+h*k3lambda1)*(beta*(I1(j+1)/N)+c(i)+miu)-(lambda2(j+1)+h*k3lambda2)*(beta*(I1(j+1)/N)+c(i)));
%         k4lambda2=h*(a+(lambda1(j+1)+h*k3lambda1)*beta*(S1(j+1)/N)-(lambda2(j+1)+h*k3lambda2)*(beta*(S1(j+1)/N)-miu*I1(j+1)-miut*I1(j+1)-alpha*I1(j+1)-r(i)*I1(j+1)-delta*I1(j+1))-(lambda3(j+1)+h*k3lambda3)*(alpha+r(i))*I1(j+1)-(lambda4(j+1)+h*k3lambda4)*delta*I1(j+1));
%         k4lambda3=h*((lambda2(j+1)+h*k3lambda2)*(q*gamma-gamma)+(lambda3(j+1)+h*k3lambda3)*(gamma+miu)-(lambda4(j+1)+h*k3lambda4)*q*gamma*T1(j+1));
%         k4lambda4=h*((lambda4(j+1)+h*k3lambda4)*miu);
        
        k1lambda1=h*(lambda1(j)*(beta*(I1(j)/N)+c(i)+miu)-lambda2(j)*(beta*(I1(j)/N)+c(i)));
        k1lambda2=h*(a+lambda1(j)*beta*(S1(j)/N)-lambda2(j)*(beta*(S1(j)/N)-miu*I1(j)-miut*I1(j)-alpha*I1(j)-r(i)*I1(j)-delta*I1(j))-lambda3(j)*(alpha+r(i))*I1(j)-lambda4(j)*delta*I1(j));
        k1lambda3=h*(lambda2(j)*(q*gamma-gamma)+lambda3(j)*(gamma+miu)-lambda4(j)*q*gamma*T1(j));
        k1lambda4=h*(lambda4(j)*miu);
        k2lambda1=h*((lambda1(j)+h2*k1lambda1)*(beta*(I1(j)/N)+c(i)+miu)-(lambda2(j)+h2*k1lambda2)*(beta*(I1(j)/N)+c(i)));
        k2lambda2=h*(a+(lambda1(j)+h2*k1lambda1)*beta*(S1(j)/N)-(lambda2(j)+h2*k1lambda2)*(beta*(S1(j)/N)-miu*I1(j)-miut*I1(j)-alpha*I1(j)-r(i)*I1(j)-delta*I1(j))-(lambda3(j)+h2*k1lambda3)*(alpha+r(i))*I1(j)-(lambda4(j)+h2*k1lambda4)*delta*I1(j));
        k2lambda3=h*((lambda2(j)+h2*k1lambda2)*(q*gamma-gamma)+(lambda3(j)+h2*k1lambda3)*(gamma+miu)-(lambda4(j)+h2*k1lambda4)*q*gamma*T1(j));
        k2lambda4=h*((lambda4(j)+h2*k1lambda4)*miu);
        k3lambda1=h*((lambda1(j)+h2*k2lambda1)*(beta*(I1(j)/N)+c(i)+miu)-(lambda2(j)+h2*k2lambda2)*(beta*(I1(j)/N)+c(i)));
        k3lambda2=h*(a+(lambda1(j)+h2*k2lambda1)*beta*(S1(j)/N)-(lambda2(j)+h2*k2lambda2)*(beta*(S1(j)/N)-miu*I1(j)-miut*I1(j)-alpha*I1(j)-r(i)*I1(j)-delta*I1(j))-(lambda3(j)+h2*k2lambda3)*(alpha+r(i))*I1(j)-(lambda4(j)+h2*k2lambda4)*delta*I1(j));
        k3lambda3=h*((lambda2(j)+h2*k2lambda2)*(q*gamma-gamma)+(lambda3(j)+h2*k2lambda3)*(gamma+miu)-(lambda4(j)+h2*k2lambda4)*q*gamma*T1(j));
        k3lambda4=h*((lambda4(j)+h2*k2lambda4)*miu);
        k4lambda1=h*((lambda1(j)+h*k3lambda1)*(beta*(I1(j)/N)+c(i)+miu)-(lambda2(j)+h*k3lambda2)*(beta*(I1(j)/N)+c(i)));
        k4lambda2=h*(a+(lambda1(j)+h*k3lambda1)*beta*(S1(j)/N)-(lambda2(j)+h*k3lambda2)*(beta*(S1(j)/N)-miu*I1(j)-miut*I1(j)-alpha*I1(j)-r(i)*I1(j)-delta*I1(j))-(lambda3(j)+h*k3lambda3)*(alpha+r(i))*I1(j)-(lambda4(j)+h*k3lambda4)*delta*I1(j));
        k4lambda3=h*((lambda2(j)+h*k3lambda2)*(q*gamma-gamma)+(lambda3(j)+h*k3lambda3)*(gamma+miu)-(lambda4(j)+h*k3lambda4)*q*gamma*T1(j));
        k4lambda4=h*((lambda4(j)+h*k3lambda4)*miu);
        
        al=(k1lambda1+2*k2lambda1+2*k3lambda1+k4lambda1)/6;
        bl=(k1lambda2+2*k2lambda2+2*k3lambda2+k4lambda2)/6;
        cl=(k1lambda3+2*k2lambda3+2*k3lambda3+k4lambda3)/6;
        dl=(k1lambda4+2*k2lambda4+2*k3lambda4+k4lambda4)/6;
    
        lambda1(j-1)=lambda1(j)-al;
        lambda2(j-1)=lambda2(j)-bl;
        lambda3(j-1)=lambda3(j)-cl;
        lambda4(j-1)=lambda4(j)-dl;

        c(j)=max(0,min(1,(((lambda1(j)-lambda2(j))*S(i))/(2*b1))));
        r(j)=max(0,min(1,(((lambda2(j)-lambda3(j))*I(i))/(2*b2))));
     end
    
    tc=((lambda1(j)-lambda2(j)).*S(i))./(2*b1);
    tr=((lambda2(j)-lambda3(j)).*I(i))./(2*b2);
    c1=max(0,min(1,tc));
    r1=max(0,min(1,tr));
    c=(0.5*(c1+oldc));
    r=(0.5*(r1+oldr));
        
   
    o=a*I+b1*(c.^2)+b2*(r.^2);
    J=min(sum(o*h));   
 
    end
%     
%     if S<=0
%         Sn=0;
%     elseif S>=1
%         Sn=1;
%     else
%         Sn=S;
%     end 
% 
%     if R<=0
%         Rn=0;
%     elseif R>=1
%         Rn=1;
%     else
%         Rn=R;
%     end 
%     
    fprintf('jumlah iterasi = %i ', kk);
    disp('')
    y(1,:)=t;
    y(2,:)=S;
    y(3,:)=I;
    y(4,:)=T;
    y(5,:)=R;
    y(6,:)=S1;
    y(7,:)=I1;
    y(8,:)=T1;
    y(9,:)=R1;
    y(10,:)=c;
    y(11,:)=r;
    y(12,:)=lambda1;
    y(13,:)=lambda2;
    y(14,:)=lambda3;
    y(15,:)=lambda4;
    y(16,:)=J;
    y(17,:)=h;

    