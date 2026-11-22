// Ohren-Übung — offline support.
// Pages and piece data: network first (updates show at once), cache when offline.
// Hashed build assets: cache first. Samples, icons: served from cache, refreshed in the background.
const CACHE = 'listening-book-v1'

self.addEventListener('install', () => self.skipWaiting())
self.addEventListener('activate', (e) => {
  e.waitUntil((async () => {
    for (const k of await caches.keys()) if (k !== CACHE) await caches.delete(k)
    await self.clients.claim()
  })())
})

self.addEventListener('fetch', (e) => {
  const req = e.request
  if (req.method !== 'GET' || new URL(req.url).origin !== self.location.origin) return
  const url = new URL(req.url)
  if (req.mode === 'navigate' || /\/data\/.+\.json$/.test(url.pathname) || url.pathname.endsWith('/credits.txt')) e.respondWith(networkFirst(req)) // fresh when online
  else if (/\/assets\/.+-[A-Za-z0-9_-]{8,}\.(js|css|woff2)$/.test(url.pathname)) e.respondWith(cacheFirst(req))
  else e.respondWith(staleWhileRevalidate(e, req))
})

async function networkFirst(req) {
  const cache = await caches.open(CACHE)
  try {
    const res = await fetch(req)
    if (res.ok) cache.put(req, res.clone())
    return res
  } catch {
    return (await cache.match(req)) || (req.mode === 'navigate' ? await cache.match('./') : null) || Response.error()
  }
}

async function cacheFirst(req) {
  const cache = await caches.open(CACHE)
  const hit = await cache.match(req)
  if (hit) return hit
  const res = await fetch(req)
  if (res.ok) cache.put(req, res.clone())
  return res
}

async function staleWhileRevalidate(e, req) {
  const cache = await caches.open(CACHE)
  const hit = await cache.match(req)
  const update = fetch(req).then((res) => { if (res.ok) cache.put(req, res.clone()); return res }).catch(() => null)
  if (hit) { e.waitUntil(update); return hit }
  return (await update) || Response.error()
}
