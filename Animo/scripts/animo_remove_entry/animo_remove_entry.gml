/// @desc Removes an animation entry to the global map
/// @param {string} tag_key     The name of the asset tag as a string.
/// @returns {bool} Returns true if the addition succeeds.
function animo_remove_entry( tag_key ) {
    var _lowercase_tag_key = string_lower( tag_key );
    
    if ( animo_character_exists( _lowercase_tag_key ) ) {
        struct_remove( __animoAnimationMap, _lowercase_tag_key );
    }
    else {
        // If entry already exists, return
        show_debug_message( $"Entry {_lowercase_tag_key} doesn't exist!" );
        return false;
    }
};