
Field station
===(5.1)

- 3 component magnetometer
   - For long periods $10^{-6}-1 \physu{Hz}$ use of flux gate magnetometers
   - For short periods $10^{-3}-10^3 \physu{Hz}$ use induction coil magnetometers
- Non-polarizable electrodes
   - e.g. Ag-AgCl have nearly no disturbing potential


Analysis of MT time series
===(5.2)

Overview of different steps:

Choice of sensors
  $\to$ Observation
  $\to$ Pretreatment of time series in time domain
  $\to$ Transform the data to frequency domain
  $\to$ Response curve
  $\to$ Power spectra, stacking
  $\to$ Calculation of the transfer functions ($Z_{xx}, Z_{xy}, Z_{yx}, Z_{yy}, T_x, T_y$)
  
1. Choice of the frequency range and magnetometer: indution coil or flux gate?
     Determination of the sampling interval $\Delta t$

2. Observation. Measure $E_x(t)$, $E_y(t)$, $H_x(t)$, $H_y(t)$, $H_z(t)$
     - Period: 1 d ... 1 yr
     - Digitalisation $H(t_j) \to x_j$, $E(t_j) \to z_j$

3. Choice of analysing intervals:
     - Intervals with strong magnetic activity but without visible noise
     - Choose time intervals suitable for FFT

4. Data processing in time domain
     - Determine the trend of each chosen time interval and substract it
     - Numerical filter
          - Aim: distinguish or emphasize suitable frequency bands
          - Preparation for the frequency analysis
       $$ y_n = \sum_{n'=-N}^{N} w_{n'}x_{n-n'} $$
       high pass, low pass filters. Consider low pass filter, e.g.
          - rectangle/sinc LP filter
             $$
               \tilde{w}(\omega) = \begin{cases}
                      1   & |\omega|<\omega_0
                    (1/2  & |\omega|=\omega_0 )
                  \\  0   & \text{otherwise}.
             $$
            This has difficulties in practice due to strong oscillations in the vicinity of cutoff frequency.
          - Trapezoidal LP filter
             $$
               \tilde{w}(\omega) = \begin{cases}
                      1   & 0<|\omega|<\omega_1
                    \frac{\omega_2-\omega}{\omega_2-\omega_1}
                          & \omega_1 < |\omega| < \omega_2
                  \\  0   & \text{otherwise}.
             $$
            The following quantities are introduced as filter parameters:
             $$
               \omega_0 = \tfrac12(\omega_1 + \omega_2)
             $$
             $$
               \Omega = \tfrac12(\omega_2 - \omega_1).
             $$
             The _steepness_ of the filter is defined by
             $$
               S = \frac{\omega_0}{\Omega}.
             $$
             The filter function $w(t)$ can be obtained by applying the FT on $\tilde{w}(\omega)$
             $$
               \omega(t) = \tfrac1\pi \int\limits_0^{\infty}\ttd{\omega} \tilde{w}\cos(\omega t)
                         = \frac{\omega_0}{\phi}\frac{\sin(\omega_0 t)}{\omega_0t}
                             \cdot\frac{\sin(\Omega t)}{\Omega t}.
             $$
             The filter should have finite length, so define $\tilde{w}(\omega):
             $$
               \tilde{w}_m(\omega) = \tilde{w}_0 + 2\sum_{n=1}^K w_n\cos(2\pinm/N)
             $$
             with
             $$
               \tilde{w}_0 = \frac{\omega_0}{\omega\rmsc{ny}}
                   \left(1 + 2\frac{\sin\alpha_n}{\alpha_n}\cdot\frac{\sin\beta_n}{\beta_n}\right)
             $$
          - Trapezoidal HP filter
             $$
               \tilde{w}\rmsc{H} = 1 - \tilde{w}\rmsc{L}.
             $$
            Instead of high pass, a polynomial equation can be applied. (???)
             $$
               y_n' = \frac{d}{T}(t - t_0 - \tfrac{\tau}{2})
             $$
            with $d = y(t_N) - y(t_0)$.
            The analysis can be realized in small and overlapping frequency ranges.
       Example of typical filter parameters
         - Magnetic storm, $T = 8\physu{d}$. $\Delta t\sim 1 h$. Low pass $0.75\physu{cpd}$, polynomial high pass.
         - Day variation, $T = 1\physu{d}$. $\Delta t\sim 1 h$. Low pass $4\physu{cpd}$, polynomial high pass.
         - Variations, $T = 6\physu{h}$. $\Delta t\sim 1 \physu{min}$. Low pass $2\physu{cpd}$, polynomial high pass.
         - Variations, $T = 6\physu{h}$. $\Delta t\sim 1 \physu{min}$. Low pass $6\physu{cpd}$, high pass $0.5\physu{cpd}$.
         - Variations, $T = 6\physu{h}$. $\Delta t\sim 1 \physu{min}$. Low pass $15\physu{cpd}$, high pass $1.5\physu{cpd}$.
         
5. Data processing in frequency domain
     - Harmonic analysis of the filtered time series
         $$
           x_j , j\in\{0\ldots N\}
            \Rightarrow \tilde{X}_m, m\in\{0\ldots M/2\}
         $$
       Outcome: raw spectra.
         $$
           x_j = \sum_{m=0}^{M} (a_m\cos(m\phi_j) + b_m\sim(m\phi_j) + S x_j
         $$
       with $\phi_j = \frac{2\pi j}{N}$.
         $$
           a_m = \frac{2}N \sum_{j=0}^{N-1} x_j\cos(m\phi_j)
         $$
         $$
           b_m = \frac{2}N \sum_{j=0}^{N-1} x_j\sin(m\phi_j)
         $$
         $$
           a_0 = \tfrac1N \sum_{j=0}^{N-1} x_j
         $$
         $$
           a_M = \tfrac1N \sum_{j=0}^{N-1} x_j(-1)^j
         $$
       The corresponding frequency
         $$
           \omega_m = \frac{2\pi}{T} = \frac{\pi}\Delta
         $$
       is called the Nyqvist frequency. The analysis for $\omega > \omega_M$ is not unique, we get _aliasing_.
       In the harmonic analysis only those frequencies are considered which are less than the Nyqvist frequency.
       It is assumed that the time series vanishes outside the transformation interval, but this must
       be enforced by multiplication with a _window function_. This is equivalent to a convolution in frequency domain.
       Example of a window functions:
        - Hann, $w(t) = \tfrac12 (1 + \cos\tfrac{2\pi}{T}(t - t_0 - T/2))$
       Different possibilities to calculate harmonic coefficients.
     - Calibration: at this stage the response curve of the device is considered. For example, with
       - $g(t)$ observed time series
       - $f(t)$ true time series
       - $r(t)$ response function of the device
       $$
        g(t) = r(t) \ast f(t)
       $$
       Example: measurement of the earth magnetic field pulsation using an induction coil magnetometer.
       - Time dom. $g(t) = r(t)\ast \partial_t f(t)$
       - Freq dom. $G(\omega) = i\omega F(\omega)$
            
  

