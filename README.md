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

El sistema de adquisición se construyó empleando una tarjeta National Instruments USB-6002, la cual permitió digitalizar la señal analógica generada por el sensor y transferirla al computador mediante conexión USB. La configuración del sistema se realizó utilizando el Data Acquisition Toolbox de MATLAB, estableciendo una frecuencia de muestreo de 100 Hz durante un tiempo de adquisición de 30 segundos, valores suficientes para capturar las variaciones lentas características del proceso respiratorio.

La salida analógica del sensor fue conectada a la entrada analógica AI0 de la tarjeta USB-6002, mientras que la alimentación del sensor se realizó mediante una fuente de 5 V y una referencia común de tierra (GND). Durante la adquisición, el usuario realizó una respiración normal en reposo, ubicando el sensor a pocos centímetros de la boca para registrar las variaciones producidas por el aire exhalado.

Una vez adquirida la señal, esta fue almacenada en formato digital para su posterior procesamiento en MATLAB. El tratamiento de la información incluyó una etapa de suavizado mediante un filtro de media móvil implementado manualmente, seguida por la detección de respiraciones y el análisis en frecuencia mediante la Transformada Rápida de Fourier (FFT), permitiendo estimar la frecuencia respiratoria a partir de los datos registrados.

Nota: En esta sección todavía no se profundiza en el funcionamiento del sensor. Esa descripción puede incluirse posteriormente en un apartado específico titulado "Descripción del sensor MQ-135" o "Principio de funcionamiento del sensor", tal como indicaste.

Llevar a cabo una revisión de la literatura sobre el proceso respiratorio, con énfasis en el reconocimiento de las variables físicas principalmente involucradas
1. Revisión de la literatura

El proceso respiratorio es un mecanismo fisiológico esencial encargado de garantizar el intercambio de gases entre el organismo y el medio ambiente. Durante la inspiración, el aire rico en oxígeno (O₂) ingresa a los pulmones, mientras que durante la espiración se elimina dióxido de carbono (CO₂), producto del metabolismo celular. Este intercambio gaseoso ocurre en los alvéolos pulmonares por difusión y es indispensable para mantener la oxigenación de los tejidos y el equilibrio ácido-base del organismo. Debido a su importancia clínica, la respiración constituye uno de los principales signos vitales evaluados en pacientes tanto en entornos hospitalarios como en sistemas de monitoreo ambulatorio.

El análisis del proceso respiratorio implica el estudio de diversas variables físicas que caracterizan la mecánica ventilatoria. Una de las más importantes es la frecuencia respiratoria (FR), definida como el número de ciclos de inspiración y espiración que ocurren en un minuto. En un adulto sano en reposo, la frecuencia respiratoria normalmente se encuentra entre 12 y 20 respiraciones por minuto, aunque puede variar según la edad, el nivel de actividad física y el estado fisiológico del individuo.

Otra variable relevante corresponde al flujo de aire, que representa la velocidad con la que el aire entra y sale de los pulmones durante cada ciclo respiratorio. Este parámetro permite evaluar la dinámica ventilatoria y suele medirse mediante neumotacógrafos o espirómetros. Asociado al flujo se encuentra el volumen corriente (VT), que corresponde a la cantidad de aire movilizada en una respiración normal, generalmente cercana a 500 mL en un adulto sano.

La presión respiratoria constituye otra variable de interés, ya que durante la inspiración se generan presiones intratorácicas negativas que favorecen la entrada de aire, mientras que durante la espiración estas presiones aumentan para permitir la salida del aire pulmonar. Las variaciones de presión son ampliamente utilizadas en ventilación mecánica y en dispositivos para la evaluación de la función pulmonar.

Adicionalmente, la composición del aire exhalado representa una variable física que ha adquirido importancia en el desarrollo de sistemas de monitoreo respiratorio. Durante la espiración aumenta la concentración de dióxido de carbono (CO₂) y de vapor de agua con respecto al aire inspirado, produciendo cambios detectables mediante sensores químicos o de gases. Estas variaciones permiten identificar el inicio y el final de cada ciclo respiratorio y constituyen una alternativa para la estimación de la frecuencia respiratoria en sistemas de bajo costo.

En los últimos años, la literatura reporta diferentes tecnologías para el monitoreo respiratorio, incluyendo sensores de flujo, sensores de presión, bandas de esfuerzo torácico, acelerómetros, sensores ópticos y sensores de gases. Cada tecnología presenta ventajas y limitaciones relacionadas con la precisión, el costo, la comodidad del usuario y la facilidad de integración con sistemas electrónicos de adquisición de datos. En aplicaciones académicas y de prototipado, resulta de interés el uso de sensores de gases debido a su disponibilidad, facilidad de implementación y capacidad para detectar las variaciones en la composición del aire exhalado.

En consecuencia, el reconocimiento de variables físicas como la frecuencia respiratoria, el flujo de aire, el volumen respiratorio, la presión y la concentración de gases constituye la base para el diseño de sistemas de adquisición y procesamiento de señales respiratorias, permitiendo desarrollar herramientas para el monitoreo fisiológico y la evaluación del estado respiratorio de los individuos.

Referencias (IEEE)

[1] J. G. Webster and J. W. Clark, Medical Instrumentation: Application and Design, 5th ed. Hoboken, NJ, USA: Wiley, 2018.

[2] J. B. West and A. M. Luks, West's Respiratory Physiology: The Essentials, 11th ed. Philadelphia, PA, USA: Wolters Kluwer, 2021.

[3] A. C. Guyton and J. E. Hall, Guyton and Hall Textbook of Medical Physiology, 14th ed. Philadelphia, PA, USA: Elsevier, 2021.

[4] American Thoracic Society and European Respiratory Society, "ATS/ERS Standardisation of Spirometry," European Respiratory Journal, vol. 26, no. 2, pp. 319–338, 2005.

ahora si seleccion del sensor e importancia o como funciona porque ya despues voy a poner resultados

Después de la revisión de la literatura, es apropiado incluir un apartado como "Selección del sensor y construcción del sistema de adquisición", donde ya justificas el uso del MQ-135.

### ** Selección del sensor e importancia**

Con base en la revisión de la literatura, se seleccionó el sensor MQ-135 para el desarrollo del sistema de monitoreo respiratorio debido a su disponibilidad, bajo costo y facilidad de integración con sistemas de adquisición de datos. Aunque este dispositivo fue diseñado originalmente para la detección de la calidad del aire, su capacidad para responder a variaciones en la concentración de dióxido de carbono (CO₂), amoníaco (NH₃), óxidos de nitrógeno (NOₓ), alcohol, humo y otros compuestos volátiles permite emplearlo en aplicaciones experimentales relacionadas con el monitoreo de la respiración.

Fig. 1.

<p align="center">
  <img src="https://github.com/user-attachments/assets/2fff9722-697b-4ad4-9ccb-765b041fa397" alt="Montaje experimental" width="500">
</p>

El principio de funcionamiento del MQ-135 se basa en un material semiconductor de dióxido de estaño (SnO₂), cuya resistencia eléctrica cambia cuando entra en contacto con diferentes concentraciones de gases. En condiciones normales, el sensor mantiene una resistencia determinada; sin embargo, cuando aumenta la concentración de los gases detectables presentes en el aire exhalado, dicha resistencia se modifica, generando una variación en el voltaje de salida. Esta señal analógica puede ser adquirida y procesada para identificar los ciclos de inspiración y espiración.

Durante el proceso respiratorio, el aire espirado contiene una concentración de dióxido de carbono significativamente mayor que el aire atmosférico. En consecuencia, cada exhalación produce una respuesta en el sensor que se manifiesta como una variación gradual del voltaje de salida. Aunque el MQ-135 presenta un tiempo de respuesta superior al de sensores respiratorios especializados y no proporciona una medición directa del flujo de aire o del volumen pulmonar, resulta adecuado para demostrar el proceso de adquisición y procesamiento de señales respiratorias en prácticas de laboratorio.

Para la adquisición de la señal se empleó una tarjeta National Instruments USB-6002, configurada mediante el Data Acquisition Toolbox de MATLAB. La salida analógica (AO) del sensor fue conectada a la entrada analógica AI0 de la tarjeta, mientras que la alimentación se realizó con una fuente de 5 V y una referencia común de tierra (GND). La adquisición se efectuó con una frecuencia de muestreo de 100 Hz durante un período de 30 segundos, condiciones suficientes para registrar las variaciones lentas producidas por el proceso respiratorio.

Una vez digitalizada, la señal fue almacenada en MATLAB para su procesamiento posterior. Debido a la presencia de pequeñas fluctuaciones asociadas al ruido electrónico y a la respuesta dinámica del sensor, se implementó un filtro de media móvil mediante programación, con el objetivo de suavizar la señal antes de realizar la detección de respiraciones y el análisis en el dominio de la frecuencia mediante la Transformada Rápida de Fourier (FFT).

