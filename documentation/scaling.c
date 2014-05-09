// ##################### System scaling ########################
/**
 * @page scaling Scaling of KerMor models
 * @short Describes how scaling is implemented in KerMor.
 *
 * Oftentimes appropriate scaling is important when dealing with physical constants etc.
 * KerMor allows to scale both state space and time.
 *
 * @section state_scaling State space scaling
 * The base dynamical system structure of KerMor is as follows:
 * @f{align}{
 *  x'(t) &= f(x(t),t,\mu) + B(t,\mu)u(t)\\
 *  x(0) &= x_0(\mu)\\
 *  y(t) &= C(t,\mu)x(t)
 * @f}
 *
 * Now scaling can be performed on `x(t)` level. The models.BaseDynSystem.StateScaling 
 * property can be set either to a scalar value or a vector of the size of system's full dimension,
 * denoting the scaling of each dimension individually.
 *
 * When state space scaling is used, the given real/unscaled initial values will be transformed according to the scaling, and the resulting
 * output `C(t,\mu)` will be provided with the re-scaled state variables.
 * This is realized by a diagonal matrix `S` in the following way:
 *
 * @f{align}{
 *  x'(t) &= f(x(t),t,\mu) + B(t,\mu)u(t)\\
 *  x(0) &= S^{-1}x_0(\mu)\\
 *  y(t) &= C(t,\mu)Sx(t)
 * @f}
 *
 * @attention Given the above scaling procedure, one must notice that the models.BaseModel.computeTrajectory will always return
 * the ''scaled'' state space vectors. Hence, training of subspaces etc. is performed on the scaled version of the model.
 * Using the models.BaseModel.simulate method will yield the re-scaled (possibly output-transformed) values.
 *
 * @subsection projected_state_scaling Scaling in reduced models
 * When reduced models are created from full models, the scaling is included in the reduced model, as the 
 * scaling process is possibly of a high dimension and thus not suitable for online computations.
 * The system below shows how the online matrices are computed for reduced models:
 * @f{align}{
 *  z'(t) &= W^tf(Vz(t),t,\mu) + \underbrace{W^tB(t,\mu)}_{\tilde{B(t,\mu)}}u(t)\\
 *  z(0) &= \underbrace{W^tS^{-1}}_{\tilde{W_s}}x_0(\mu)\\
 *  y(t) &= \underbrace{C(t,\mu)SV}_{\tilde{C(t,\mu)}}z(t)
 * @f}
 * 
 * @section time_scaling Time scaling
 * Time scaling in KerMor is easy. The models.BaseModel.dt and models.BaseModel.T determine the real simulation times, and the 
 * models.BaseModel.tau scalar the time scaling. The scaled times are used automatically inside the simulations.
 * This means all components must expect scaled times if scaling is used.
 *
 * @attention Given the above scaling procedure, one must notice that the models.BaseModel.computeTrajectory will always return
 * the ''scaled'' times `t_i`. Using the models.BaseModel.simulate method will yield the re-scaled time steps.
 */
