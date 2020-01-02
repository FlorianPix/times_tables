FOR /L %%A IN (1,1,189) DO (
    magick convert gif-%%A.png gif-%%A.gif
)
del *.png