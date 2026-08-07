clear;
clc;
close all;

fs = 100;
T = 30;

dq = daq("ni");
addinput(dq,"Dev2","ai0","Voltage");
dq.Rate = fs;

disp('===============================')
disp('Iniciando adquisición...')
disp('Respire normalmente')
disp('===============================')

tt = read(dq,seconds(T));

time = seconds(tt.Time);
data = tt.Dev2_ai0;

disp('Adquisición finalizada')

figure
plot(time,data)
grid on
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Señal Original')

N = 20;
senal = zeros(size(data));

for i = 1:length(data)

    suma = 0;
    contador = 0;

    for j = 0:N-1

        if i-j > 0
            suma = suma + data(i-j);
            contador = contador + 1;
        end

    end

    senal(i) = suma/contador;

end

senal = (-1)*senal;

figure
plot(time,senal)
grid on
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Señal Filtrada')

umbral = mean(senal);

locs = [];
pks = [];

distancia = round(1.5*fs);
ultimo = -distancia;

for i = 2:length(senal)-1

    if senal(i) > senal(i-1) && ...
       senal(i) > senal(i+1) && ...
       senal(i) > umbral

        if (i-ultimo) >= distancia

            locs = [locs i];
            pks = [pks senal(i)];
            ultimo = i;

        end

    end

end

figure
plot(time,senal,'b')
hold on
plot(time(locs),pks,'ro','MarkerFaceColor','r')
grid on
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Respiraciones Detectadas')

numResp = length(locs);

FR = numResp*60/T;

fprintf('\n');
fprintf('Respiraciones detectadas: %d\n',numResp);
fprintf('Frecuencia respiratoria: %.2f rpm\n',FR);

Nfft = length(senal);

Y = fft(senal);

P = abs(Y)/Nfft;

f = (0:Nfft-1)*fs/Nfft;

figure
plot(f,P)
xlim([0 2])
grid on
xlabel('Frecuencia (Hz)')
ylabel('Magnitud')
title('FFT')

valorMax = 0;
indice = 2;

for i = 2:floor(Nfft/2)

    if P(i) > valorMax

        valorMax = P(i);
        indice = i;

    end

end

freqDominante = f(indice);

fprintf('Frecuencia dominante: %.3f Hz\n',freqDominante);
fprintf('Frecuencia respiratoria (FFT): %.2f rpm\n',freqDominante*60);

save('Resultados_MQ135.mat','data','senal','time','FR','freqDominante');

disp('Proceso terminado correctamente')
