static bool shellsurf_shmifev_handler(
	struct comp_surf* surf, struct arcan_event* ev)
{
	if (ev->category == EVENT_TARGET)
		switch (ev->tgt.kind){
/* resize? or focus change? */
		case TARGET_COMMAND_DISPLAYHINT:{
			int w = ev->tgt.ioevs[0].iv;
			int h = ev->tgt.ioevs[1].iv;
			if (w && h && (w != surf->acon.w || h != surf->acon.h)){
				trace("shell_surface(request resize to %d*%d)", w, h);
				wl_shell_surface_send_configure(
					surf->shell_res, WL_SHELL_SURFACE_RESIZE_NONE, w, h);
			}
		}
/* use the default handler for surface callback */
		return false;
		break;
		case TARGET_COMMAND_EXIT:
/* do we send destroy on the surface instead? */
			return true;
		break;
		default:
		break;
		}

	return false;
}

static bool shell_defer_handler(
	struct surface_request* req, struct arcan_shmif_cont* con)
{
	if (!req || !con){
		wl_resource_post_no_memory(req->target);
		return false;
	}

	struct wl_resource* ssurf = wl_resource_create(req->client->client,
		&wl_shell_surface_interface, wl_resource_get_version(req->target), req->id);

	if (!ssurf){
		wl_resource_post_no_memory(req->target);
		return false;
	}

	struct comp_surf* surf = wl_resource_get_user_data(req->target);
	wl_resource_set_implementation(ssurf, &ssurf_if, surf, NULL);
	surf->acon = *con;
	surf->cookie = 0xfeedface;
	surf->shell_res = ssurf;
	surf->dispatch = shellsurf_shmifev_handler;
	return true;
}

static void shell_getsurf(struct wl_client* client,
	struct wl_resource* res, uint32_t id, struct wl_resource* surf_res)
{
	trace("get shell surface");
	struct comp_surf* surf = wl_resource_get_user_data(surf_res);
	request_surface(surf->client, &(struct surface_request){
		.segid = SEGID_APPLICATION,
		.target = surf_res,
		.id = id,
		.dispatch = shell_defer_handler,
		.client = surf->client,
		.source = surf
	});
}
