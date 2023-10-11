function animo_prefix_trim_enable( state ) {
    if ( !is_bool( state ) ) {
        show_error( $"Argument must be boolean.", true );
    }
    
    global.animo_trim_prefixes = state;
}