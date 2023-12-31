/// @desc Retrieves an animation from an entry in the global map and returns it.
/// @param {string} tag_key         The name of the asset tag as a string.
/// @param {string} animation_key   animation_key The name of the animation as a string.
/// @returns {struct} Returns the animation struct if it is retrieved
function animo_get_animation( tag_key, animation_key ) {
    var _lowercase_tag_key = string_lower( tag_key );
    var _lowercase_animo_key = string_lower( animation_key );
    
    if ( animo_animation_exists( _lowercase_tag_key, _lowercase_animo_key ) ) {
        return __animoAnimationMap[$ _lowercase_tag_key].animations[$ _lowercase_animo_key];
    }
    else {
        show_debug_message( $"Animo with key [{_lowercase_animo_key}] does not exist." );
        return;
    }
};