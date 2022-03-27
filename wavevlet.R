# Wavelet Space time and position
#
# A fourier transform (FT) will tell you what frequencies are present in
# your signal. A wavelet transform (WT) will tell you what frequencies
# are present and where (or at what scale). If you had a signal that was
# changing in time, the FT wouldn't tell you when (time) this has
# occurred. You can also think of replacing the time variable with a
# space variable, with a similar analogy.

# A wavelet can be defined within a certain time span, starting at
#  f(t_0) = 0 and ending at f(t_end) at 0. This then gives us time
#  localization.

# On the other hand, a Fourier transform is an integral from t =
# -infinity to t = +infinity. So there is no time localization.
 

wave_analyse <- function() {


  tmp <- inrixNorth$Speed
  dat <- data.frame(tmp = tmp)
  w_est <- analyze.wavelet(dat, "tmp",        ## need both df & colname
                         loess.span = 0,    ## no de-trending
                         dt = 1/12,         ## monthly sampling
                         lowerPeriod = 1/6, ## default = 2*dt
                         n.sim = 100,
                         verbose = FALSE)

  w_est <- analyze.wavelet(dat, "tmp", loess.span = 0, dt = 1/31, lowerPeriod = 1/6, n.sim = 100, verbose = TRUE)


  pdf("wavelet_colour.pdf") ; wt.image(w_est); dev.off()
  reconstruct(w_est)

  dev.close()
}