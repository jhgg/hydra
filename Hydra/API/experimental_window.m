#include "helpers.h"
#include "experimental_private.h"
#include <Carbon/Carbon.h>

#define hydra_window(L, idx) *((AXUIElementRef*)luaL_checkudata(L, idx, "window"))
CGWindowID _get_window_id(lua_State* L, int idx) {
    AXUIElementRef win = hydra_window(L, idx);
    CGWindowID winid;
    
//    lua_getuservalue(L, idx);
    
//    lua_getfield(L, -1, "id");
//    if (lua_isnumber(L, -1)) {
//        winid = lua_tonumber(L, -1);
//        goto end;
//    }
    
    AXError err = _AXUIElementGetWindow(win, &winid);
    if (err) {
        winid = -1;
        goto end;
    }
//    lua_pushnumber(L, winid);
//    lua_setfield(L, -2, "id");
    
    end:
//        lua_pop(L, 1);
        return winid;
}

int experimental_window_getalpha(lua_State* L) {
    CGWindowID winid = _get_window_id(L, 1);
    float alpha;
    CGSGetWindowAlpha(CGSDefaultConnection, winid, &alpha);
    lua_pushnumber(L, alpha);
    return 1;
}

int experimental_window_setalpha(lua_State* L) {
    CGWindowID winid = _get_window_id(L, 1);
    double alpha = lua_tonumber(L, 2);
    CGError err = SetWindowAlpha(winid, alpha);
    NSLog(@"%d", err);
    
    return 0;
}

static const luaL_Reg experimental_windowlib[] = {
    {"getalpha", experimental_window_getalpha},
    {"setalpha", experimental_window_setalpha},
    {NULL, NULL}
};

int luaopen_experimental_window(lua_State* L) {
    luaL_newlib(L, experimental_windowlib);
    return 1;
}