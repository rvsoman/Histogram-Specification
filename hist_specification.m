%%%%%%% Histogram Specification

clc; clear all; close all;
int_level=[0 1 2 3 4 5 6 7]; %input('enter gray level values');
%input('enter number of pixels for each gray level');
ip_pixel=[8 10 10 2 12 16 4 2];  

%if the input image is given, then to find the number of pixels
%corresponding to each gray level value
%a=input('input image matrix');
% a=a(:)';
% b=num2str(a);
% int_level=[0 1 2 3 4 5 6 7];
% final=[];
% for i=1:length(int_level)
%     u=int_level(i);
%     c=count(b,num2str(u));
%     final=[final c];
% end


ip_cdf=[]; %cdf for input image
flag=0;
for i=1:length(ip_pixel)
    flag=flag+ip_pixel(i);
    ip_cdf=[ip_cdf flag];
end
total=ip_cdf(length(ip_cdf));
ip_equ=[]; %input equalized value

L=(2^length(dec2bin(max(int_level))));
for i=1:length(ip_cdf)
    a=round((ip_cdf(i)/total)*(L-1));
    ip_equ=[ip_equ a];
end


%%%%%%target image
%input('enter number of pixels for each gray level for target iamge');
t_pixel=[0 0 0 0 20 20 16 8];
t_cdf=[];        %cdf for target image
flag2=0;
for i=1:length(t_pixel)
    flag2=flag2 + t_pixel(i);
    t_cdf=[t_cdf flag2];
end
total2=t_cdf(length(t_cdf));


t_equ=[]; %target equalized value

L2=(2^length(dec2bin(max(int_level))));
for i=1:length(t_cdf)
    a2=round((t_cdf(i)/total2)*(L2-1));
    t_equ=[t_equ a2];
end

map=[];  %final mapped values array
for i=1:length(int_level)
    a=ip_equ(i);
    index_arr=[];
    index_arr=find(t_equ>=a);
    b=index_arr(1);
    map=[map int_level(b)];
end
disp(map);


