#include <Carbon/Carbon.h>

#define CGSConnectionID CGSConnection
#define CGSWindowID CGSWindow
#define CGSDefaultConnection _CGSDefaultConnection()

typedef int CGSConnection;
typedef int CGSWindow;
typedef int CGSWorkspace;
typedef int CGSValue;

extern CGSConnection _CGSDefaultConnection(void);
extern CGError CGSSetWindowAlpha(const CGSConnection cid, const CGSWindow wid, float alpha);
extern CGError CGSSetWindowListAlpha(const CGSConnection cid, CGSWindow *wids, int count, float alpha);
extern CGError CGSGetWindowAlpha(const CGSConnection cid, const CGSWindow wid, float* alpha);

extern AXError _AXUIElementGetWindow(AXUIElementRef, CGWindowID* out);