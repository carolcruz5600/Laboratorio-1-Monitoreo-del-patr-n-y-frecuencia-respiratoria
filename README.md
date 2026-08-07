# Laboratorio 1: Monitoreo del patrón y frecuencia respiratoria

## Integrantes
* Carol Valentina Cruz Becerra

## Objetivos

### Objetivo General
Implementar un sistema de adquisición y procesamiento de señales respiratorias utilizando un sensor, con el fin de estimar y comparar la frecuencia respiratoria de una persona en condiciones de reposo y durante el habla.

### Objetivos Específicos
- Identificar las variables que intervienen en el proceso de la respiración.
- Diseñar un sistema que logre captar el patrón respiratorio y calcular la frecuencia respiratoria.

> ### Parte A
### **Revisión de la literatura**

El proceso respiratorio es un mecanismo fisiológico esencial encargado de garantizar el intercambio de gases entre el organismo y el medio ambiente. Durante la inspiración, el aire rico en oxígeno (O₂) ingresa a los pulmones, mientras que durante la espiración se elimina dióxido de carbono (CO₂), producto del metabolismo celular. Este intercambio gaseoso ocurre en los alvéolos pulmonares por difusión y es indispensable para mantener la oxigenación de los tejidos y el equilibrio ácido-base del organismo. Debido a su importancia clínica, la respiración constituye uno de los principales signos vitales evaluados en pacientes tanto en entornos hospitalarios como en sistemas de monitoreo ambulatorio.

El análisis del proceso respiratorio implica el estudio de diversas variables físicas que caracterizan la mecánica ventilatoria. Una de las más importantes es la frecuencia respiratoria (FR), definida como el número de ciclos de inspiración y espiración que ocurren en un minuto. En un adulto sano en reposo, la frecuencia respiratoria normalmente se encuentra entre 12 y 20 respiraciones por minuto, aunque puede variar según la edad, el nivel de actividad física y el estado fisiológico del individuo.

Otra variable relevante corresponde al flujo de aire, que representa la velocidad con la que el aire entra y sale de los pulmones durante cada ciclo respiratorio. Este parámetro permite evaluar la dinámica ventilatoria y suele medirse mediante neumotacógrafos o espirómetros. Asociado al flujo se encuentra el volumen corriente (VT), que corresponde a la cantidad de aire movilizada en una respiración normal, generalmente cercana a 500 mL en un adulto sano.

La presión respiratoria constituye otra variable de interés, ya que durante la inspiración se generan presiones intratorácicas negativas que favorecen la entrada de aire, mientras que durante la espiración estas presiones aumentan para permitir la salida del aire pulmonar. Las variaciones de presión son ampliamente utilizadas en ventilación mecánica y en dispositivos para la evaluación de la función pulmonar.

Adicionalmente, la composición del aire exhalado representa una variable física que ha adquirido importancia en el desarrollo de sistemas de monitoreo respiratorio. Durante la espiración aumenta la concentración de dióxido de carbono (CO₂) y de vapor de agua con respecto al aire inspirado, produciendo cambios detectables mediante sensores químicos o de gases. Estas variaciones permiten identificar el inicio y el final de cada ciclo respiratorio y constituyen una alternativa para la estimación de la frecuencia respiratoria en sistemas de bajo costo.

En los últimos años, la literatura reporta diferentes tecnologías para el monitoreo respiratorio, incluyendo sensores de flujo, sensores de presión, bandas de esfuerzo torácico, acelerómetros, sensores ópticos y sensores de gases. Cada tecnología presenta ventajas y limitaciones relacionadas con la precisión, el costo, la comodidad del usuario y la facilidad de integración con sistemas electrónicos de adquisición de datos. En aplicaciones académicas y de prototipado, resulta de interés el uso de sensores de gases debido a su disponibilidad, facilidad de implementación y capacidad para detectar las variaciones en la composición del aire exhalado.

Para el desarrollo de la práctica se seleccionó un sensor semiconductor de gases como elemento principal de adquisición, debido a su disponibilidad, bajo costo y facilidad de integración con sistemas electrónicos de adquisición de datos. Aunque existen sensores específicamente diseñados para medir la respiración, el objetivo de la práctica consistió en implementar un sistema completo de adquisición y procesamiento de señales utilizando los recursos disponibles en el laboratorio.

### **Selección del sensor e importancia**

Con base en la revisión de la literatura, se seleccionó el sensor MQ-135 para el desarrollo del sistema de monitoreo respiratorio debido a su disponibilidad, bajo costo y facilidad de integración con sistemas de adquisición de datos. Aunque este dispositivo fue diseñado originalmente para la detección de la calidad del aire, su capacidad para responder a variaciones en la concentración de dióxido de carbono (CO₂), amoníaco (NH₃), óxidos de nitrógeno (NOₓ), alcohol, humo y otros compuestos volátiles permite emplearlo en aplicaciones experimentales relacionadas con el monitoreo de la respiración.

<p align="center">
  <img src="https://github.com/carolcruz5600/Laboratorio-1-Monitoreo-del-patr-n-y-frecuencia-respiratoria/blob/main/SENSOR-DETECTOR-DE-GAS-MQ-135.png?raw=true" width="400" alt="Sensor MQ-135">
</p>

<p align="center">
  Fig. 1.
</p>

El principio de funcionamiento del MQ-135 se basa en un material semiconductor de dióxido de estaño (SnO₂), cuya resistencia eléctrica cambia cuando entra en contacto con diferentes concentraciones de gases. En condiciones normales, el sensor mantiene una resistencia determinada; sin embargo, cuando aumenta la concentración de los gases detectables presentes en el aire exhalado, dicha resistencia se modifica, generando una variación en el voltaje de salida. Esta señal analógica puede ser adquirida y procesada para identificar los ciclos de inspiración y espiración.

Durante el proceso respiratorio, el aire espirado contiene una concentración de dióxido de carbono significativamente mayor que el aire atmosférico. En consecuencia, cada exhalación produce una respuesta en el sensor que se manifiesta como una variación gradual del voltaje de salida. Aunque el MQ-135 presenta un tiempo de respuesta superior al de sensores respiratorios especializados y no proporciona una medición directa del flujo de aire o del volumen pulmonar, resulta adecuado para demostrar el proceso de adquisición y procesamiento de señales respiratorias en prácticas de laboratorio.

Para la adquisición de la señal se empleó una tarjeta National Instruments USB-6002, configurada mediante el Data Acquisition Toolbox de MATLAB. La salida analógica (AO) del sensor fue conectada a la entrada analógica AI0 de la tarjeta, mientras que la alimentación se realizó con una fuente de 5 V y una referencia común de tierra (GND). La adquisición se efectuó con una frecuencia de muestreo de 100 Hz durante un período de 30 segundos, condiciones suficientes para registrar las variaciones lentas producidas por el proceso respiratorio.

Una vez digitalizada, la señal fue almacenada en MATLAB para su procesamiento posterior. Debido a la presencia de pequeñas fluctuaciones asociadas al ruido electrónico y a la respuesta dinámica del sensor, se implementó un filtro de media móvil mediante programación, con el objetivo de suavizar la señal antes de realizar la detección de respiraciones y el análisis en el dominio de la frecuencia mediante la Transformada Rápida de Fourier (FFT).

### **Resultados**

#### Sistema de Adquisición: [lab1.m](lab1.m)

<p align="center">
<img width="500" height="332" src="https://github.com/user-attachments/assets/faf57acc-102d-4a07-acec-a6481688ff13" />
</p>

<p align="center">
  Fig. 2.
</p>

La adquisición de la señal respiratoria se realizó durante un intervalo de 30 segundos utilizando el sensor MQ-135 conectado a la tarjeta de adquisición NI USB-6002, con una frecuencia de muestreo de 100 Hz. La señal obtenida presentó variaciones de voltaje asociadas a los cambios en la concentración de gases presentes en el aire exhalado durante cada ciclo respiratorio.

Posteriormente, la señal fue procesada mediante un filtro de media móvil, con el propósito de reducir las fluctuaciones de alta frecuencia y facilitar la identificación de los ciclos respiratorios. Como se observa en la Figura X, el filtrado permitió obtener una señal más suave, en la que es posible distinguir claramente los máximos correspondientes a cada exhalación.

El algoritmo de detección de máximos locales identificó cinco respiraciones durante los 30 segundos de adquisición, representadas por los marcadores rojos sobre la señal filtrada. A partir de este conteo se estimó una frecuencia respiratoria de 10 respiraciones por minuto (rpm).

Adicionalmente, se realizó un análisis en el dominio de la frecuencia mediante la Transformada Rápida de Fourier (FFT), obteniéndose una frecuencia dominante de 0.267 Hz, equivalente a aproximadamente 16 respiraciones por minuto. La diferencia entre el valor obtenido por el conteo de respiraciones y el estimado mediante la FFT puede atribuirse al tiempo de respuesta del sensor MQ-135, el cual presenta una respuesta más lenta que los sensores respiratorios especializados. Asimismo, el filtro aplicado y la resolución del análisis espectral pueden influir en la estimación de la frecuencia dominante.

A pesar de esta diferencia, ambos métodos evidencian el comportamiento periódico de la respiración y demuestran que el sistema de adquisición fue capaz de registrar las variaciones producidas por el aire exhalado. Los resultados obtenidos permiten concluir que el MQ-135 constituye una alternativa funcional para prácticas académicas de adquisición y procesamiento de señales respiratorias, aunque no alcanza la precisión de sensores específicamente diseñados para aplicaciones biomédicas.

<p align="center">
<img width="500" height="332" alt="image" src="https://github.com/user-attachments/assets/71e72121-08d4-4b06-a084-92020dd84e47" />
</p>

<p align="center">
  Fig. 3.
</p>

<div align="center">

| Parámetro                        |        Valor |
|----------------------------------|-------------:|
| Tiempo de adquisición            |         30 s |
| Frecuencia de muestreo           |       100 Hz |
| Respiraciones detectadas         |            5 |
| Frecuencia respiratoria (conteo) |   **10 rpm** |
| Frecuencia dominante (FFT)       | **0.267 Hz** |
| Frecuencia respiratoria (FFT)    |   **16 rpm** |

</div>

<p align="center">
<img width="500" height="332" alt="image" src="https://github.com/user-attachments/assets/99eb3757-d021-46cd-90e6-150ec6a92f80" />
</p>

<p align="center">
  Fig. 4.
</p>

Se muestra la señal respiratoria después de aplicar el filtro de media móvil y el resultado del algoritmo de detección de respiraciones. La curva azul corresponde a la señal filtrada, mientras que los marcadores rojos representan los máximos locales identificados por el algoritmo como eventos respiratorios. Se observa que, tras un breve período inicial de estabilización del sensor, la señal presenta un comportamiento periódico con picos claramente definidos, los cuales corresponden a las exhalaciones detectadas. En total se identificaron cinco respiraciones durante el intervalo de adquisición de 30 segundos, obteniéndose una frecuencia respiratoria de 10 respiraciones por minuto. Aunque el algoritmo detectó correctamente la mayoría de los ciclos respiratorios, también se evidencia una variación en la amplitud de los picos, atribuida a la respuesta dinámica del sensor MQ-135 y a las diferencias en la intensidad de cada exhalación. En general, la señal filtrada permitió distinguir adecuadamente el patrón respiratorio y facilitó el cálculo de la frecuencia respiratoria mediante el conteo de máximos locales.

<p align="center">
  <img width="1118" height="746" alt="image" src="https://github.com/user-attachments/assets/87794400-e7c1-4145-a524-e276dc256348" />
</p>

<p align="center">
  Fig. 5.
</p>

<div align="center">

| Parámetro | Valor |
|:---------------------------------|:------:|
| Tiempo de adquisición | 30 s |
| Frecuencia de muestreo | 100 Hz |
| Respiraciones detectadas | 7 |
| Frecuencia respiratoria (conteo) | **14 rpm** |
| Frecuencia dominante (FFT) | **0.033 Hz** |
| Frecuencia respiratoria (FFT) | **2 rpm** |

</div>

### Análisis de resultados

Durante la práctica se realizaron dos adquisiciones de la señal utilizando el sensor MQ-135. La primera correspondió al monitoreo de la respiración en estado de reposo, mientras que la segunda se llevó a cabo con el participante hablando frente al sensor, con el propósito de analizar el comportamiento de la señal bajo diferentes condiciones.

En la primera adquisición, la señal presentó un comportamiento periódico característico del proceso respiratorio. Después de aplicar el filtro de media móvil, fue posible reducir las fluctuaciones de alta frecuencia y resaltar los máximos correspondientes a las exhalaciones. El algoritmo de detección identificó 7 respiraciones en un intervalo de 30 segundos, obteniéndose una frecuencia respiratoria de 14 respiraciones por minuto, valor que se encuentra dentro del rango fisiológico esperado para un adulto sano en reposo.

Por otra parte, la segunda adquisición, realizada mientras la persona hablaba, presentó una señal con mayor variabilidad tanto en la amplitud como en la periodicidad de los picos. Este comportamiento se explica porque durante el habla la respiración se modifica para controlar el flujo de aire necesario para la producción de la voz, generando exhalaciones de distinta duración e intensidad. Como consecuencia, la señal pierde parte de la regularidad observada durante la respiración en reposo, dificultando la identificación automática de los ciclos respiratorios.

El análisis espectral mediante la Transformada Rápida de Fourier (FFT) arrojó una frecuencia dominante de 0.033 Hz, equivalente a aproximadamente 2 respiraciones por minuto. Este resultado no coincide con el obtenido mediante el conteo de picos, lo que indica que la componente dominante identificada por la FFT estuvo influenciada por variaciones de muy baja frecuencia presentes en la señal, como la deriva del sensor o el proceso de estabilización inicial. Por esta razón, el conteo de picos proporcionó una estimación más representativa de la frecuencia respiratoria durante la práctica.

En general, los resultados evidencian que el sensor MQ-135 fue capaz de registrar las variaciones producidas por el aire exhalado, permitiendo diferenciar el patrón respiratorio en reposo del comportamiento observado durante el habla. Asimismo, se comprobó la importancia del procesamiento digital de la señal para mejorar la calidad de la información obtenida y facilitar la extracción de parámetros fisiológicos.

### Preguntas

1. ¿Son los patrones respiratorios y frecuencias respiratorias iguales o diferentes en cada caso? ¿A qué se debe esto?

No, los patrones respiratorios y las frecuencias respiratorias fueron diferentes entre las dos condiciones evaluadas. Durante la adquisición realizada en reposo, la señal presentó un comportamiento más periódico y uniforme, con picos distribuidos de manera relativamente constante, lo que permitió detectar una frecuencia respiratoria de 14 respiraciones por minuto, valor que se encuentra dentro del rango fisiológico normal para un adulto sano.

En cambio, cuando la persona hablaba, la señal mostró una mayor variabilidad tanto en la amplitud como en el intervalo entre los picos. Esto ocurre porque durante el habla el flujo de aire exhalado es controlado para producir sonidos, lo que modifica el patrón natural de la respiración. Además, se presentan pausas para inspirar y exhalaciones prolongadas durante la pronunciación de palabras, haciendo que la señal pierda periodicidad y sea más difícil estimar la frecuencia respiratoria mediante métodos automáticos.

2. ¿Cuáles serían las ventajas y desventajas de emplear múltiples sensores para el monitoreo del proceso respiratorio? ¿Cuáles podrían ser las razones?

El uso de múltiples sensores puede mejorar significativamente el monitoreo del proceso respiratorio, ya que permite obtener información complementaria de diferentes variables fisiológicas. Por ejemplo, combinar un sensor de gases con un sensor de flujo de aire, una banda de esfuerzo torácico o un acelerómetro proporciona una descripción más completa del ciclo respiratorio y aumenta la confiabilidad de las mediciones.

Entre las ventajas se encuentran una mayor precisión en la estimación de la frecuencia respiratoria, la posibilidad de validar la información obtenida por diferentes sensores, una mayor resistencia al ruido o fallos individuales y la capacidad de analizar simultáneamente variables como el movimiento torácico, el flujo de aire y la composición del aire exhalado.

Sin embargo, también existen desventajas. La incorporación de varios sensores incrementa el costo del sistema, aumenta la complejidad del diseño electrónico y del procesamiento de señales, requiere sincronizar correctamente la información proveniente de cada dispositivo y puede reducir la comodidad del usuario debido al mayor número de elementos utilizados durante la medición.

### Conclusiones

- Se implementó satisfactoriamente un sistema de adquisición de señales respiratorias utilizando el sensor MQ-135, la tarjeta de adquisición NI USB-6002 y MATLAB, permitiendo registrar las variaciones de voltaje asociadas al aire exhalado durante el proceso respiratorio.
- El procesamiento de la señal mediante un filtro de media móvil permitió reducir el ruido y facilitar la detección de los ciclos respiratorios. A partir del conteo de picos se estimó una frecuencia respiratoria de 14 respiraciones por minuto, valor que se encuentra dentro del rango fisiológico esperado para una persona sana en reposo.
- La señal adquirida mientras la persona hablaba presentó una mayor variabilidad y menor periodicidad debido a las modificaciones naturales del patrón respiratorio durante la producción del habla, evidenciando que esta actividad influye directamente en la forma de la señal registrada.
- El análisis mediante FFT no proporcionó una estimación adecuada de la frecuencia respiratoria en esta práctica, ya que la frecuencia dominante estuvo influenciada por componentes de muy baja frecuencia presentes en la señal. Esto resalta la importancia de aplicar etapas adicionales de acondicionamiento y procesamiento antes de realizar análisis espectrales cuando se emplean sensores de gases como el MQ-135.
- La práctica permitió comprender las etapas fundamentales de un sistema de adquisición biomédica, incluyendo la captura de la señal, el procesamiento digital y la extracción de parámetros fisiológicos, demostrando la utilidad de herramientas como MATLAB y las tarjetas de adquisición de datos para el desarrollo de aplicaciones de monitoreo respiratorio.

### Referencias

[1] J. G. Webster and J. W. Clark, Medical Instrumentation: Application and Design, 5th ed. Hoboken, NJ, USA: Wiley, 2018.

[2] J. B. West and A. M. Luks, West's Respiratory Physiology: The Essentials, 11th ed. Philadelphia, PA, USA: Wolters Kluwer, 2021.

[3] A. C. Guyton and J. E. Hall, Guyton and Hall Textbook of Medical Physiology, 14th ed. Philadelphia, PA, USA: Elsevier, 2021.

[4] American Thoracic Society and European Respiratory Society, "ATS/ERS Standardisation of Spirometry," European Respiratory Journal, vol. 26, no. 2, pp. 319–338, 2005.
