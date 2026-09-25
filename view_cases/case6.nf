workflow {

    // Case 6: combine()
    //
    // TODO: Predict how many lines .view() will print below. Then run
    // this file and check.
    //
    
    ch_a = channel.of('sample_a', 'sample_b')
    ch_b = channel.of(15, 21, 25)

    // Combine creates a cross-product of both channels
    ch_c = ch_a.combine(ch_b)
    ch_c.view { v -> "[case 6] $v" }

    // TODO: Add one line that calls .count() on ch_c and .view()s it.

    

}
