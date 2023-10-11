#macro __animoFallbackSprite __spr_animo_fallback
#macro __animoVersion "0.0.2"
#macro __animoWelcomeString $"------------------------------------\nWelcome To Animo v{__animoVersion}\n------------------------------------"

show_debug_message( __animoWelcomeString );

global.animo_trim_prefixes = true; 

globalvar __animoAnimationMap; 
__animoAnimationMap = {};

globalvar __animoRegex; 
__animoRegex = ["spr_", "spr"];

enum ANIMO_TYPE {
    FINITE, // Will animate once and then return to the first frame
    LOOPED, // Will loop over and over
    PINGPONG, // Will hit the final frame before animating back to the first
    CHAINED, // Inputted animation will transition to a different one once it ends
}