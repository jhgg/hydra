#include "helpers.h"

/// === experimental ===
/// Expiremental functionality based off of Private OS X APIs. Use at your own risk.



static const luaL_Reg experimentallib[] = {
    {NULL, NULL}
};

int luaopen_experimental(lua_State* L) {
    luaL_newlib(L, experimentallib);
    return 1;
}