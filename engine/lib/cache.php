<?php
/**
 * Elgg cache
 * Cache file interface for caching data.
 */

/**
 * Returns an \Elgg\Cache\BaseCache object suitable for caching system information
 *
 * @return \Elgg\Cache\BaseCache
 */
function elgg_get_system_cache(): \Elgg\Cache\BaseCache {
	return _elgg_services()->fileCache;
}

/**
 * Reset the system cache by deleting the caches
 *
 * @return void
 */
function elgg_reset_system_cache(): void {
	_elgg_services()->systemCache->reset();
}

/**
 * Saves a system cache.
 *
 * @param string $type         The type or identifier of the cache
 * @param mixed  $data         The data to be saved
 * @param int    $expire_after Number of seconds to expire the cache after
 *
 * @return bool
 */
function elgg_save_system_cache(string $type, $data, int $expire_after = null): bool {
	return _elgg_services()->systemCache->save($type, $data, $expire_after);
}

/**
 * Retrieve the contents of a system cache.
 *
 * @param string $type The type of cache to load
 *
 * @return mixed null if key not found in cache
 */
function elgg_load_system_cache(string $type) {
	return _elgg_services()->systemCache->load($type);
}

/**
 * Deletes the contents of a system cache.
 *
 * @param string $type The type of cache to delete
 * @return bool
 * @since 3.0
 */
function elgg_delete_system_cache(string $type): bool {
	return _elgg_services()->systemCache->delete($type);
}

/**
 * Is system cache enabled
 *
 * @return bool
 * @since 2.2.0
 */
function elgg_is_system_cache_enabled(): bool {
	return _elgg_services()->systemCache->isEnabled();
}

/**
 * Enables the system disk cache.
 *
 * Uses the 'system_cache_enabled' config with a boolean value.
 * Resets the system cache.
 *
 * @return void
 */
function elgg_enable_system_cache(): void {
	_elgg_services()->systemCache->enable();
}

/**
 * Disables the system disk cache.
 *
 * Uses the 'system_cache_enabled' config with a boolean value.
 * Resets the system cache.
 *
 * @return void
 */
function elgg_disable_system_cache(): void {
	_elgg_services()->systemCache->disable();
}

/* Simplecache */

/**
 * Registers a view to simple cache.
 *
 * Simple cache is a caching mechanism that saves the output of
 * a view and its extensions into a file.
 *
 * @warning Simple cached views must take no parameters and return
 * the same content no matter who is logged in.
 *
 * @param string $view_name View name
 *
 * @return void
 * @see elgg_get_simplecache_url()
 * @since 1.8.0
 */
function elgg_register_simplecache_view(string $view_name): void {
	_elgg_services()->simpleCache->registerCacheableView($view_name);
}

/**
 * Get the URL for the cached view.
 *
 * ```
 * $blog_js = elgg_get_simplecache_url('elgg/blog/save_draft.js');
 * $favicon = elgg_get_simplecache_url('favicon.ico');
 * ```
 *
 * This automatically registers the view with Elgg's simplecache.
 *
 * @param string $view The full view name
 *
 * @return string
 * @since 1.8.0
 */
function elgg_get_simplecache_url(string $view): string {
	return _elgg_services()->simpleCache->getUrl($view);
}

/**
 * Is simple cache enabled
 *
 * @return bool
 * @since 1.8.0
 */
function elgg_is_simplecache_enabled(): bool {
	return _elgg_services()->simpleCache->isEnabled();
}

/**
 * Enables the simple cache.
 *
 * @see elgg_register_simplecache_view()
 * @return void
 * @since 1.8.0
 */
function elgg_enable_simplecache(): void {
	_elgg_services()->simpleCache->enable();
}

/**
 * Disables the simple cache.
 *
 * @warning Simplecache is also purged when disabled.
 *
 * @see elgg_register_simplecache_view()
 * @return void
 * @since 1.8.0
 */
function elgg_disable_simplecache(): void {
	_elgg_services()->simpleCache->disable();
}

/**
 * Invalidate all the registered caches
 *
 * @return void
 * @since 3.3
 */
function elgg_invalidate_caches(): void {
	// this event sequence could take while, make sure there is no timeout
	set_time_limit(0);
	
	_elgg_services()->config->save('lastcache', time());
	
	_elgg_services()->events->triggerSequence('cache:invalidate', 'system');
}

/**
 * Clear all the registered caches
 *
 * @return void
 * @since 3.3
 */
function elgg_clear_caches(): void {
	// this event sequence could take while, make sure there is no timeout
	set_time_limit(0);
	
	_elgg_services()->events->triggerSequence('cache:clear', 'system');
}

/**
 * Purge all the registered caches
 *
 * This will remove all old/stale items from the caches
 *
 * @return void
 * @since 3.3
 */
function elgg_purge_caches(): void {
	// this event sequence could take while, make sure there is no timeout
	set_time_limit(0);
	
	_elgg_services()->events->triggerSequence('cache:purge', 'system');
}
