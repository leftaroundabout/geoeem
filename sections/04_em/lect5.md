

Basic equations for EM methods
===

Decay time of free space charges follows an exponential law $\eta(t) = \eta_0 e^{-t/\tau}$, where
$$(2.2)
  \tau = \frac{\epsilon \epsilon_0}{\sigma}
$$
- For air: $\sigma \approx 10{-14}\physu{S/m}$, $\epsilon=1$ thus $\tau \approx 15\physu{min}$.
- For subsurface: $\sigma \approx 10{-5}\physu{S/m}$, $\epsilon=1..80$ thus $\tau \approx 10^{-4}\physu{s}$.

Equtions for
- Static fields -- no induction
- in time scale of $\tau$ slowly oscillating fields -- quasi-stationary fields
    - Induction by induced currents much larger than displacement currents
- in time scale of $\tau$ quickly oscillating fields -- displacement currents

                      | Static          | Slow           | Quick
$\nabla\times\Magn$   | $\mu_0\jCurr$   | $\mu_0\jCurr$  | $\mu_0\epsilon\epsilon_0\dot E$
$\nabla\times\Elct$   | $0$             | $-\dot\Magn$   | $-\dot\Magn$


General Maxwell equations for $\Elct$ and $\Magn$ as field quantities
---

$$(2.3a)
  \nabla\times\Elct  = -\dot{\Magn}
$$
Ampere's law states that every closed loop of current will have an associated magnetic
field of magnitude proportional to the total current flow:
$$(2.3b)
  \nabla\times\Magn  = \mu_0(\sigma\Elct + \partial_t\Elct)
$$
$$(2.3c)
  \nabla\cdot\Magn   = 0
$$
$$(2.3d)
  \nabla\cdot\Elct   = \eta/\epsilon_0
$$

Rotation of (2.3a) gives
$$
  \nabla\times\nabla\times\Elct = -\nabla\times\Magn
$$
Time-deriv of (2.3b) gives
$$
  \nabla\times\partial_t\Magn = \mu_0(\sigma\dot\Elct + \epsilon_0\ddot\Elct).
$$
Without sources in the conductive subsurface $\nabla\cdot\jCurr = \nabla\cdot(\sigma\Elct) = 0$.
Using the double rotation identity, it follows for $\sigma\gg\omega\epsilon$:
$$(2.6)
  \nabla^2\Field = \mu_0 \sigma \dot\Field
$$
where $\Field$ can be eithe electric or magnetic field.
This is a diffusion equation for the fields coming from
the external sources and diffusing through the earth.
Thus EM fields propagate diffusively; our measurements yield \emph{volume} soundings
(response functions are volumetric averages of the sample medium).

OTOH, for quickly oscillating fields:
$$(2.7)
  \nabla^2\Field = \mu_0\epsilon\epsilon_0\ddot\Field.
$$

For the quasi-static fields in non-conductors:
$$
  \nabla\times\Magn = 0
$$
$\Magn$ can be represented as gradient of a scalar potential:
$$
  \Magn = -\nabla U
$$
with $\nabla^2 U = 0$.

Application areas:

- Atmosphere:
    - For $T\gg15\physu{min}$, field variations diffuse through the atmosphere.
    - In smaller time scales, they travel as waves.
    

Fourier transform of the field quantities
---

Switch to (position-space) frequency domain:
$$
  \Magn(\posr,t) \to \tilde\Magn(\posr, \omega)
$$
where $\omega=\frac{2\pi}T$ is the angular frequency, $\tilde\Magn$ a complex Fourier amplitude.
$$
  \tilde f(\omega) = \IRint\ttd{t}\: f(t)e^{-i\omega t}
$$
$$
  f(t) = \frac1{2\pi}\IRint\ttd{t}\: \tilde f(\omega)e^{i\omega t}
$$

Induction equations in $(\posr,\omega)$ domain with $n=1$:
$$(2.10)
  \nabla^2\tilde\Field = i\omega\mu_0\sigma\tilde\Field
$$
Wave equations:
$$
  \nabla^2\Field = -\mu_0\epsilon\epsilon_0\omega^2\tilde\Field.
$$
We scale (2.10) with the skin-depth formula:
$$
  p = \sqrt{\frac{2}{\omega\mu_0\sigma}}
$$
which increases with $\sqrt{\rho T}$
$$
  \nabla^2\Field = (\tfrac{1+i}{p})^2\tilde\Field
$$
The wave equation can be expressed in terms of the speed of light $c = (\mu_0\epsilon\epsilon_0)^{-1/2}$
$$
  \nabla^2\tilde{Field}
$$

Estimation of $p$ in km:
- $T$ in s (Pulsations): $p = \tfrac12\sqrt{\rho/\Ohmm \cdot T/\physu{s}}$


Now switch also to wavenumber domain (in cartesian coordinates):
$$
  \posr = x \unitV{x} + y\unitV{y} + z\unitV{z}
$$
Assume in the following
$$
  \wavnum = k\rmsc{x}\unitV{x} + k\rmsc{y}\unitV{y}
$$
$$
  k = \sqrt{k\rmsc{x}^2 + k\rmsc{y}^2}
$$
2D Fourier transform of the induction eqn:
$$(2.13)
  \nabla^2\hat\Field = -k^2 \hat\Field + \frac{\ttd^2\Field}{\ttd z^2}
$$
$$
  \frac{\ttd^2\hat{\Field_x}}{\ttd z^2} = (i\omega\mu_0\sigma + k^2)\hat\Field_x
$$
We introduce the \emph{vertical wave number}
$$(1+14)
  K = \sqrt{i\omega\mu_0\sigma + k^2} = \sqrt{(\tfrac{1+i}{p})^2 + k^2}
$$
in a layer of conductivity $\sigma$. $C = K^{-1}$ is called \emph{complex penetration depth}.

Make further approximations: for $(p\cdot k)^2 \gg 1$,
$$
  K \approx k(1+\tfrac{i}{(pk)^2}
$$
which means the field diffuses through the layer like it would through a non-conductor.
For $(p\cdot k)^2 \ll 1$,
$$
  K \approx \frac{1+i}{p}(1 - \tfrac{i}4(pk)^2)
$$
which means the field diffuses like a quasi-homogeneous field ($k=0$).

Example: oscillating current in height $H=300\physu{km}$
---

- For $T = 36\physu{s}$, $p = 30\physu{km}$ so $p\cdot k = 0.15$, i.e. diffusion is dictated by $p$
- For $T = 1\physu{h}$, $p = 300\physu{km}$ so $p\cdot k = 1.5$, which permits neither approximation
- For $T = 24\physu{h}$, $p = 1500\physu{km}$, diffusion is dictated by $k$.



Induction in homogeneous half space
===

Solutions in $z>0$ and $z<0$ can be combined by continuity equations.

1. Solution for tangential-electric source field (e.g. plane layer currents in the ionosphere) $E\rmsc{z}=0$
    - Induced currents are also plane layer currents
    - $E\rmsc{z} = 0$ in the whole space (\emph{tangential electric} fields).

For $z>0$ solution of eq. 2.13 $\frac{\ttd^2\hat{E}\rmsc{x}}{\ttd z^2} = (i\omega\mu_0\sigma + k^2)\hat{E}\rmsc{x}$
$$
  \hat{E}\rmsc{x}(z,k,w) = A\rmsc{x} e^{-Kz} + B\rmsc{x}e^{Kz}
$$
$$
  \hat{E}\rmsc{y}(z,k,w) = A\rmsc{y} e^{-Kz} + B\rmsc{y}e^{Kz}
$$
Constraint: $E\rmsc{x}\to 0$ as $z \to\infty$

Derivation of the ma/detic field from $\Elct$ using
$$
  \nabla\times\tilde\Elct = -i\omega\tilde\Magn
$$
$$
  \nabla\times\tilde\Elect
    = \left( \partial_y\tilde E\rmsc{z} - \partial_z \tilde E\rmsc{y} \right) \unitV{x}
    + \left( \partial_z\tilde E\rmsc{x} - \partial_x \tilde E\rmsc{z} \right) \unitV{y}
    + \left( \partial_x\tilde E\rmsc{y} - \partial_y \tilde E\rmsc{x} \right) \unitV{z}
    = \left( - \partial_z \tilde E\rmsc{y} \right) \unitV{x}
    + \left( \partial_z\tilde E\rmsc{x}  \right) \unitV{y}
    + \left( \partial_x\tilde E\rmsc{y} - \partial_y \tilde E\rmsc{x} \right) \unitV{z}
$$
$$
  \nabla\times\hat\Elct
     = -\frac{\ttd\hat E\rmsc{y}}{\ttd z}\unitV{x}
       + \frac{\ttd\hat E\rmsc{x}}{\ttd z}\unitV{y}
       + (ik\rmsc{x} \hat E\rmsc{y} - ik\rmsc{y}\hat E\rmsc{x})
$$
$$(2.15)
  \hat B\rmsc{x} = \frac{1}{i\omega}\frac{\ttd\hat E\rmsc{y}}{\ttd z}
$$
$$
  \hat B\rmsc{y} = -\frac{1}{i\omega}\frac{\ttd\hat E\rmsc{x}}{\ttd z}
$$
$$
  \hat B\rmsc{z} = \tfrac1\omega (k\rmsc{y}\hat E\rmsc{x} - k\rmsc{x}\hat E\rmsc{y})
$$

For $-H < z < 0$: solution of (2.5) (Helmholtz)
$$
  \hat E\rmsc{x} = a\rmsc{x} e^{-K_0 z} + b\rmsc{x} e^{K_0 z}
$$
$$
  \hat E\rmsc{y} = a\rmsc{y} e^{-K_0 z} + b\rmsc{y} e^{K_0 z}
$$
with
$$
  K_0 = \sqrt{i\omega\mu_0\sigma + k^2 - k\rmsc{EM}}
$$
and
$$(2.16)
  k\rmsc{EM} = \omega\sqrt{\mu_0\epsilon\epsilon_0} = \frac{\omega}{c}
$$
$K_0$ is the wavenumber of an EM wave propagating with the velocity of light $c$
$$
  c = \frac{\lambda\rmsc{EM}}{T} = \frac{\omega}{k\rmsc{EM}}.
$$

Example contributions to $K_0$:
$$
  \sigma_0 = 10^{-14}\physu{S/m} \thus p_0 \geq \frac12 10^2\physu{km}
$$
for $T>1\physu{s}$.

$$
  \lambda = 2\pi R\rmsc{E} \thus k\geq R_E^{-1} \approx \frac1{6000}\physu{km^{-1}}
$$
$p_0k \geq \frac{10^7}{12000}$, thus diffusion through the atmosphere is like through a conductor with $\sigma = 0$.

