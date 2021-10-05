% IS LD2 
clear all;
clc;
%% Main task
% 1. Duomenų paruošimas
x = 0:1/19:1;
d = ((1 + 0.2*sin(2*pi*x/0.6)) + 0.8*sin(2*pi*x))/2;
figure(1)
plot(x, d, 'r+');
title('Pradinių duomenų grafikas');
grid on;

% 2. Tinklo struktūros parinkimas
% paslėptojo sluoksnio svoriai (5 neuronai)
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

% 3. Tinklo atsako skaičiavimas
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
% aktyvavimo funkcija (tiesinė)
y1_2 = v1_2;
end
