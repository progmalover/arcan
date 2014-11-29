/*
 * Copyright 2003-2014, Björn Ståhl
 * License: 3-Clause BSD, see COPYING file in arcan source repository.
 * Reference: http://arcan-fe.com
 */

#ifndef _HAVE_ARCAN_LUA
#define _HAVE_ARCAN_LUA

/* arcan_luactx* is just an intermediary alias for lua_State */
struct arcan_luactx;

/* we separate alloc and mapfunctions to allow partial VM execution
 * BEFORE we have exposed the engine functions. This allows "constants"
 * to be calculated while still enforcing the themename() entrypoint */
struct arcan_luactx* arcan_lua_alloc();
void arcan_lua_mapfunctions(
	struct arcan_luactx* dst, int debuglevel);

char* arcan_luaL_main(struct arcan_luactx*, const char* input, bool file_in);
void arcan_luaL_dostring(struct arcan_luactx*, const char* sbuf);
void arcan_luaL_shutdown(struct arcan_luactx*);

/* add a set of wrapper functions exposing arcan_video and friends
 * to the Lua state, debugfuncs corresponds to desired debug level / behavior */
arcan_errc arcan_lua_exposefuncs(struct arcan_luactx* dst,
	unsigned char debugfuncs);

void arcan_lua_setglobalint(struct arcan_luactx* ctx, const char* key, int val);
void arcan_lua_setglobalstr(struct arcan_luactx* ctx,
	const char* key, const char* val);
void arcan_lua_pushevent(struct arcan_luactx* ctx, arcan_event* ev);
bool arcan_lua_callvoidfun(struct arcan_luactx* ctx,
	const char* fun, bool warn);
void arcan_lua_pushargv(struct arcan_luactx* ctx, char** argv);

/* used to implement an interactive shell,
 * iterate the global (_G) table for a matching prefix, yield callback
 * for each hit, with (key, type, tag) as the callback arguments */
void arcan_lua_eachglobal(struct arcan_luactx* ctx, char* prefix,
	int (*callback)(const char*, const char*, void*), void* tag);

/* for initialization, update / push all the global constants used */
void arcan_lua_pushglobalconsts(struct arcan_luactx* ctx);

/* serialize a Lua- parseable snapshot of the various mapped subsystems
 * and resources into the (dst) filestream.
 * If delim is set, we're in streaming mode so a delimiter will be added
 * to account for more snapshots over the same stream */
void arcan_lua_statesnap(FILE* dst, const char* tag, bool delim);

/*
 * (tag) will contain the active lua context, will be invoked once
 * for every frameserver that needs to be adopted by the new context.
 */
void arcan_luaL_adopt(arcan_vobj_id id, void* tag);

/* nonblock/read from (dst) filestream until an #ENDBLOCK\n tag is encountered,
 * parse this and push it into the struct arcan_luactx as the first
 * and only argument to the function pointed out with (dstfun). */
void arcan_lua_stategrab(struct arcan_luactx* ctx, char* dstfun, int fd);
#endif
