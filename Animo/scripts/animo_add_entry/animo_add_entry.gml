/// @desc Adds a new animation entry to the global map
/// @param {string} tag_key     The name of the asset tag as a string.
/// @returns {bool} Returns true if the addition succeeds.
function animo_add_entry( tag_key ) {
    var _lowercase_tag_key = string_lower( tag_key );
    
    if ( is_undefined( __animoAnimationMap[$ _lowercase_tag_key] ) ) {
        __animoAnimationMap[$ _lowercase_tag_key] = new cAnimoMapEntry();
        return true;
    }
    else {
        // If entry already exists, return
        show_debug_message( $"Entry {_lowercase_tag_key} already exists!" );
        return false;
    }
};