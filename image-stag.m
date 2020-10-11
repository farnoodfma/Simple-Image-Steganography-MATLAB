clc 
clear all
close all
im = imread('cameraman.tif');
bin = de2bi(im,8);
%converting image to 8 bitmaps
for i=1:8
    x=bin(:,i);
    x=reshape(x,size(im));
    subplot(2,4,i);
    imshow(x,[]);
    title(num2str(i));
end

%Here is the string that you want to hide
message = 'Hello!';
asci=int8(message);
%converting the string to binary
b=de2bi(asci,8);
b=b';
b=b(:);
disp('array b is');
disp(b);
disp('this is x');
disp(x);
x=x(:);
%hiding the characters of the message in the lowest rate bitmap
for i=(1:numel(message))
    x((i-1)*8+1:i*8)=b((i-1)*8+1:i*8);
end
bin(:,1)=reshape(x,size(bin(:,1)));

%reconstruting the image after hiding the message
simage=zeros(size(im));
for i=1:8
    x=bin(:,i);
    x=reshape(x,size(im));
    simage=simage+double(x)*2^(i-1);
end

figure;imshow(simage,[]);title('reconstructed');

bin=de2bi(simage,8);
figure;
for i=1:8
    x=bin(:,i);
    x=reshape(x,size(simage));
    subplot(2,4,i);imshow(x,[]);title(num2str(i))
end
x=bin(:,1);
x=x(:);
m=[];
for i=1:6
    temp=x((i-1)*8+1:i*8);
    m=[m char(bi2de(temp'))];
end

%getting the message after dividing the pic and going through its bitmaps
disp(m);



    




