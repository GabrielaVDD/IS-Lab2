% IS LD2 
clear all;
close all;
clc;
%% Main task
% Duomenų paruošimas
x = 0:1/19:1;
d = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;
figure(1)
plot(x, d, 'r+');
title('Grafikas');
hold on
grid on;

% Tinklo struktūros parinkimas (pasirinkti 5 neuronai)
% paslėptojo sluoksnio svoriai
w11_1 = randn(1);
w21_1 = randn(1);
w31_1 = randn(1);
w41_1 = randn(1);
w51_1 = randn(1);
b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);
b5_1 = randn(1);

% išėjimo sluoksnio svoriai
w11_2 = randn(1);
w12_2 = randn(1);
w13_2 = randn(1);
w14_2 = randn(1);
w15_2 = randn(1);
b1_2 = randn(1);

% Tinklo atsako skaičiavimas
p = 0.2;
for i = 1:100000
for n = 1:length(x)
% paslėptojo sluoksnio neuronams
v1_1 = x(n)*w11_1 + b1_1;
v2_1 = x(n)*w21_1 + b2_1;
v3_1 = x(n)*w31_1 + b3_1;
v4_1 = x(n)*w41_1 + b4_1;
v5_1 = x(n)*w51_1 + b5_1;
% aktyvavimo funkcija (sigmoidinė)
y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));
% išėjimo sluoksnio neuronui
v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + b1_2;
% atsakas (tiesinė aktyvavimo funkcija)
y = v1_2;
% klaidos skaičiavimas
e = d(n) - y;

% Svorių atnaujinimas
% klaidos gradientas išėjimo sluoksnio neuronui
delta1_2 = e;
% klaidos gradientas paslėpto sluoksnio neuronams
delta1_1 = y1_1*(1-y1_1)*delta1_2*w11_2;
delta2_1 = y2_1*(1-y2_1)*delta1_2*w12_2;
delta3_1 = y3_1*(1-y3_1)*delta1_2*w13_2;
delta4_1 = y4_1*(1-y4_1)*delta1_2*w14_2;
delta5_1 = y5_1*(1-y5_1)*delta1_2*w15_2;
% išėjimo sluoksnio svorių atnaujinimas
w11_2 = w11_2 + p*delta1_2*y1_1;
w12_2 = w12_2 + p*delta1_2*y2_1;
w13_2 = w13_2 + p*delta1_2*y3_1;
w14_2 = w14_2 + p*delta1_2*y4_1;
w15_2 = w15_2 + p*delta1_2*y5_1;
b1_2 = b1_2 + p*delta1_2;
% paslėptojo sluoksnio svorių atnaujinimas
w11_1 = w11_1 + p*delta1_1*x(n);
w21_1 = w21_1 + p*delta2_1*x(n);
w31_1 = w31_1 + p*delta3_1*x(n);
w41_1 = w41_1 + p*delta4_1*x(n);
w51_1 = w51_1 + p*delta5_1*x(n);
b1_1 = b1_1 + p*delta1_1;
b2_1 = b2_1 + p*delta2_1;
b3_1 = b3_1 + p*delta3_1;
b4_1 = b4_1 + p*delta4_1;
b5_1 = b5_1 + p*delta5_1;
end
end
%-----------------------------------
Y = zeros(1, length(d));
for n = 1:length(x)
% paslėptojo sluoksnio neuronams
v1_1 = x(n)*w11_1 + b1_1;
v2_1 = x(n)*w21_1 + b2_1;
v3_1 = x(n)*w31_1 + b3_1;
v4_1 = x(n)*w41_1 + b4_1;
v5_1 = x(n)*w51_1 + b5_1;
% aktyvavimo funkcija (sigmoidinė)
y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));
% išėjimo sluoksnio neuronui
v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + b1_2;
% aktyvavimo funkcija (tiesinė aktyvavimo funkcija)
y = v1_2;
Y(n) = y;
end
plot(x, Y, 'b+')
legend('Norimas atsakas','Gautas atsakas');

% PAPILDOMA UŽDUOTIS