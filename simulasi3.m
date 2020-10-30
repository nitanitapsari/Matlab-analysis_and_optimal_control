clc;
clear all;

%tanpa kontrol
[T1, Y1]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0, 0, 0.25, 0.5, 0.5), [0 60], [0.2921; 0.2921; 0.2921; 0.1237]);
%kontrol terapi saja
[T2, Y2]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0, 0, 0.25, 0.5, 0.5), [0 60], [0.2921; 0.2921; 0.2921; 0.1237]);
%kontrol vaksin saja
[T3, Y3]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0.2104, 0, 0.25, 0.5, 0.5), [0 60], [0.2921; 0.2921; 0.2921; 0.1237]);
%kontrol vaksin dan terapi
[T4, Y4]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0.1429, 0.8571, 0.25, 0.5, 0.5), [0 60], [0.2921; 0.2921; 0.2921; 0.1237]);

% %tanpa kontrol
% [T1, Y1]=ode23(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0, 0, 0.25, 0.5, 0.5), [0 60], [0.09737; 0.09737; 0.09737; 0.030925]);
% %kontrol terapi saja
% [T2, Y2]=ode23(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0, 0, 0.25, 0.5, 0.5), [0 60], [0.09737; 0.09737; 0.09737; 0.030925]);
% %kontrol vaksin saja
% [T3, Y3]=ode23(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0.2104, 0, 0.25, 0.5, 0.5), [0 60], [0.09737; 0.09737; 0.09737; 0.030925]);
% %kontrol vaksin dan terapi
% [T4, Y4]=ode23(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0.1429, 0.8571, 0.25, 0.5, 0.5), [0 60], [0.09737; 0.09737; 0.09737; 0.030925]);


% %tanpa kontrol
% [T1, Y1]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0, 0, 0.25, 0.5, 0.5), [0 200], [0.2921; 0.2921; 0.2921; 0.1237]);
% %kontrol terapi saja
% [T2, Y2]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0, 0, 0.25, 0.5, 0.5), [0 200], [0.2921; 0.2921; 0.2921; 0.1237]);
% %kontrol vaksin saja
% [T3, Y3]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0.9333, 0, 0.25, 0.5, 0.5), [0 200], [0.2921; 0.2921; 0.2921; 0.1237]);
% %kontrol vaksin dan terapi
% [T4, Y4]=ode45(@(t,y) pk(t, y, 0.45, 0.1, 0.5, 0.2, 0.91, 1, 0.2, 0.2, 0.85, 0.9333, 0.0667, 0.25, 0.5, 0.5), [0 200], [0.2921; 0.2921; 0.2921; 0.1237]);

% % COBAAA
% size(Y1(:,2))
% [y1_n, y2_n]= normalisasi(Y1(:,1), Y4(:,1))
% plot(T1,y1_n, T4,y2_n ,'--','LineWidth',2);
% % axis([0 60 0 1]);
% title('Populasi Rentan (S)dengan kontrol Terapi dan Vaksinasi'); 
% legend('tanpa kontrol','dengan kontrol'); 
% grid; 
% xlabel('Waktu (hari)'); 
% ylabel('Jumlah Populasi');
% hold on

figure(1)
[y1_n, y2_n]= normalisasi(Y1(:,1), Y2(:,1))
plot(T1,y1_n, T2,y2_n ,'--','LineWidth',2);
title('Populasi Rentan (S)dengan kontrol Terapi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid; 
xlabel('Waktu'); 
ylabel('Jumlah Populasi');
hold on

figure(2)
[y1_n, y2_n]= normalisasi(Y1(:,1), Y3(:,1))
plot(T1,y1_n, T3,y2_n ,'--','LineWidth',2);
title('Populasi Rentan (S)dengan kontrol Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid; 
xlabel('Waktu'); 
ylabel('Jumlah Populasi');
hold on

figure(3)
size(Y1(:,2));
[y1_n, y2_n]= normalisasi(Y1(:,1), Y4(:,1))
plot(T1,y1_n, T4,y2_n ,'--','LineWidth',2);
title('Populasi Rentan (S)dengan kontrol Terapi dan Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid; 
xlabel('Waktu'); 
ylabel('Jumlah Populasi');
hold on

figure(4)
[y1_n, y2_n]= normalisasi(Y1(:,2), Y2(:,2))
plot(T1,y1_n, T2,y2_n ,'--','LineWidth',2);
title('Populasi Terinfeksi (I) dengan kontrol Terapi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on

figure(5)
[y1_n, y2_n]= normalisasi(Y1(:,2), Y3(:,2))
plot(T1,y1_n, T3,y2_n ,'--','LineWidth',2);
title('Populasi Terinfeksi (I) dengan kontrol Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on


figure(6)
[y1_n, y2_n]= normalisasi(Y1(:,2), Y4(:,2))
plot(T1,y1_n, T4,y2_n ,'--','LineWidth',2);
title('Populasi Terinfeksi (I) dengan kontrol Terapi dan Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on


figure(7)
[y1_n, y2_n]= normalisasi(Y1(:,3), Y2(:,3))
plot(T1,y1_n, T2,y2_n ,'--','LineWidth',2);
title('Populasi Pengobatan (T)dengan kontrol Terapi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on

figure(8)
[y1_n, y2_n]= normalisasi(Y1(:,3), Y3(:,3))
plot(T1,y1_n, T3,y2_n ,'--','LineWidth',2);
title('Populasi Pengobatan (T)dengan kontrol Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on

figure(9)
[y1_n, y2_n]= normalisasi(Y1(:,3), Y4(:,3))
plot(T1,y1_n, T4,y2_n ,'--','LineWidth',2);
title('Populasi Pengobatan (T)dengan kontrol Terapi dan Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on

figure(10)
[y1_n, y2_n]= normalisasi(Y1(:,4), Y2(:,4))
plot(T1,y1_n, T2,y2_n ,'--','LineWidth',2);
title('Populasi Sembuh (R)dengan kontrol Terapi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on


figure(11)
[y1_n, y2_n]= normalisasi(Y1(:,4), Y3(:,4))
plot(T1,y1_n, T3,y2_n ,'--','LineWidth',2);
title('Populasi Sembuh (R)dengan kontrol Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on


figure(12)
[y1_n, y2_n]= normalisasi(Y1(:,4), Y4(:,4))
plot(T1,y1_n, T4,y2_n ,'--','LineWidth',2);
title('Populasi Sembuh (R) dengan kontrol Terapi dan Vaksinasi'); 
legend('tanpa kontrol','dengan kontrol'); 
grid;
xlabel('Waktu');
ylabel('Jumlah Populasi');
hold on


