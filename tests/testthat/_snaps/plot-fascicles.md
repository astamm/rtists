# S3 method autoplotly for `maf_df` objects works

    Code
      autoplotly::autoplotly(uf_left)
    Message <cliMessage>
      i Displaying 2042 streamlines...
      i Coloring streamlines by orientation...
    Message <packageStartupMessage>
      
      Attaching package: 'purrr'
      
      The following object is masked from 'package:testthat':
      
          is_null
      

# Passing a user-defined point coloring function works

    Code
      autoplotly::autoplotly(uf_left, color_fn = color_by_orientation)
    Message <cliMessage>
      i Displaying 2042 streamlines...
      i Coloring streamlines using user-supplied function `color_by_orientation()`...

# S3 method plot for `maf_df` objects works

    Code
      plot(uf_left)
    Message <cliMessage>
      i Displaying 2042 streamlines...
      i Coloring streamlines by orientation...

