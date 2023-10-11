/// @desc This function will initialize an entry in the global animo map and then auto-populate it with animations based on what sprites are tagged with the tag key.
/// @param {string} tag_key         The name of the asset tag as a string.
/// @param {number} ?name_regex    Naming pattern to use
function animo_init_character( tag_key, _name_regex = __animoRegex ) {
    var _lowercase_tag_key = string_lower( tag_key );
    var _tagged_asset_array = tag_get_assets( _lowercase_tag_key );
    var _tagged_asset_ids = tag_get_asset_ids( _lowercase_tag_key, asset_sprite );
	
	// If there is not entry in the map, create one.
	if ( !animo_character_exists( _lowercase_tag_key ) ) {
		animo_add_entry( _lowercase_tag_key );
	}
	
    if ( is_undefined( tag_key ) 
    || !is_string( tag_key ) ) {
        show_error( "No asset tag defined", true );
    }
    
    /* 
        This can probably be done better but this will work for now. 
    */

    // Looping through every single asset with the character tag and intializing a generic animation
    for( var i = 0; i < array_length( _tagged_asset_array ); ++i ) {
        var _asset_name = sprite_get_name( _tagged_asset_ids[i] );
        var _trimmed_key = "";
        var _animo_key = "";
        var _animo_sprite = -1;
        
        // Iterating over the prefix pattern
        if ( global.animo_trim_prefixes ) {
	        for ( var j = 0; j < array_length( __animoRegex ); ++j ) {
	            var _regex_pattern = __animoRegex[j];
	            var _regex_length = string_length( __animoRegex[j] );
	            var _string_pos = string_pos( _regex_pattern, _asset_name );
	            
	            if ( _string_pos == 1 ) {
	                // Only remove the first occurence of the prefix.
	                _trimmed_key = string_delete( _asset_name, 1, _regex_length );
	                break;
	            }
	        }
	        _animo_key = string_lower( _trimmed_key );
        }
        else {
	        _animo_key = string_lower( _asset_name );
        }
        
		_animo_sprite = _tagged_asset_ids[i];
        
        // We initialize the animations speed with the default speed set in the actual asset
        var _default_anim_speed = 0;
        
        // Convert the speed depending on the speed type. ( ugh )
        switch( sprite_get_speed_type( asset_get_index( _asset_name ) ) ) {
        	case spritespeed_framespersecond:
        		_default_anim_speed = sprite_get_speed( asset_get_index( _asset_name ) ) / game_get_speed( gamespeed_fps );
        		break;
        	case spritespeed_framespergameframe:
        		_default_anim_speed = sprite_get_speed( asset_get_index( _asset_name ) );
        		break;
        }
		
        global.__animoAnimationMap[$ _lowercase_tag_key].animations[$ _animo_key] = animo_init_looped( _animo_sprite, _default_anim_speed );
    }

    var _ms = ( get_timer() / 1000 );
    show_debug_message( $"Animo initialized animations from tag [{_lowercase_tag_key}] took {_ms}ms" );
};