workflow {

    // Case 2: channel.of() with a single list argument
    //
    // TODO: Predict how many lines .view() will print below. Then run
    // this file and check.
    //
    

    // Makes a channel with a list of items
    ch_a = channel.of(['sample_a', 'sample_b', 'sample_c', 'sample_d'])
    ch_a.view { v -> "[case 2] $v" }
    
    // TODO: Add one line that calls .count() on ch_a and .view()s it.
    

}
