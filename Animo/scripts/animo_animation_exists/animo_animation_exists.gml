/// @param {string} tag_key     The name of the asset tag as a string.
/// @param {string} animation_key
/// @returns {bool} Returns true if the animation exists, false if it does not
function animo_animation_exists( tag_key, animation_key ) {
    var _lowercase_tag_key = string_lower( tag_key );
    
    if ( !is_undefined( __animoAnimationMap[$ _lowercase_tag_key] ) ) {
        if ( struct_exists( __animoAnimationMap[$ _lowercase_tag_key], "animations" ) ) {
            var _animation_data = __animoAnimationMap[$ _lowercase_tag_key].animations;
            
            if ( !is_undefined( _animation_data[$ animation_key] ) ) {
                return true;
            }
        }
    }
    else {
        return false;
    }
};