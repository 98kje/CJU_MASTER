from filterpy.kalman import UnscentedKalmanFilter, MerweScaledSigmaPoints
from scipy.linalg import block_diag

class UKF:
    def __init__(self, dt, wheelbase, std_a, std_yawdd):
        # state vector: [x, y, v, yaw, yawd]
        self.n_x = 5
        # augmented state vector: [x, y, v, yaw, yawd, nu_a, nu_yawdd]
        self.n_aug = 7
        # sigma points will be 2*n_aug+1
        self.n_sig = 2 * self.n_aug + 1

        self.dt = dt
        self.wheelbase = wheelbase

        # Process noise standard deviation longitudinal acceleration in m/s^2
        self.std_a = std_a
        # Process noise standard deviation yaw acceleration in rad/s^2
        self.std_yawdd = std_yawdd

        self.augmented_x = np.zeros((self.n_aug, 1))
        self.P_aug = np.zeros((self.n_aug, self.n_aug))

        # initialize UKF
        self.UKF = self.init_UKF()

    def init_UKF(self):
        points = MerweScaledSigmaPoints(n=self.n_aug, alpha=0.2, beta=2., kappa=1.)
        ukf = UnscentedKalmanFilter(dim_x=self.n_x, dim_z=2, dt=self.dt, hx=self.hx, fx=self.fx,
                                    points=points)
        ukf.x = np.array([0, 0, 0, 0, 0])  # initial state
        ukf.P = np.eye(self.n_x)  # initial covariance
        ukf.R = np.array([[0.15, 0],
                          [0, np.deg2rad(1)]])  # measurement noise
        ukf.Q = block_diag(np.array([[0.1, 0],
                                     [0, np.deg2rad(0.1)]]),
                           np.array([[0.1, 0, 0, 0],
                                     [0, np.deg2rad(1), 0, 0],
                                     [0, 0, 1, 0],
                                     [0, 0, 0, 1]]))  # process noise

        return ukf

    def fx(self, x, dt):
        # state transition function
        x_out = np.zeros_like(x)
        x_out[0] = x[2] * np.cos(x[3]) * dt
        x_out[1] = x[2] * np.sin(x[3]) * dt
        x_out[2] = 0
        x_out[3] = x[4] * dt
        x_out[4] = 0

        return x + x_out

    def hx(self, x):
        # measurement function
        return np.array([x[0], x[3]])

    def predict(self):
        self.UKF.predict()

    def update(self, z):
        self.UKF.update(z)

    def get_state(self):
        return self.UKF.x[:4]  # [x, y, v, yaw]

    def main():

        # initial state
        state = State(x=-0.0, y=-3.0, yaw=0.0, v=0.0)
        # UKF initialization
        ukf = UKF(dt=dt, wheelbase=WB, std_a=0.5, std_yawdd=np.deg2rad(30))

        lastIndex = len(cx) - 1
        time = 0.0
        states = States()
        states.append(time, state)
        target_course = TargetCourse(cx, cy)
        target_ind, _ = target_course.search_target_index(state)

        while T >= time and lastIndex > target_ind:

            ukf.predict()  # UKF prediction step

            # Calc control input
            ai = proportional_control(target_speed, state.v)
            di, target_ind = pure_pursuit_steer_control(
                state, target_course, target_ind)

            state.update(ai, di)  # Control vehicle

            ukf.update([state.x, state.yaw])  # UKF update step

            time += dt
            states.append(time, state)