/**
 * Arugula, a Cloudflare Zaraz managed component. On every page view it loads the Arugula
 * site-search script (with its integrity hash), configured with channel zaraz. The script attaches
 * to the site's search box and shows offers that fit, with tracked links.
 *
 * The settings go through `window.adagentSearch`: search.js reads that global, so it keeps its name.
 * One file with no imports, so it needs no build before `managed-component-to-cloudflare-worker`.
 */
const SCRIPT = "https://api.arugulanet.com/embed/v0.5.3/search.js";
/** Keep in step with /embed/v0.5.3/integrity.json (webapp ADAG-206). */
const SRI = "sha384-zA3WSKKc0LPhJbRva74fnPt5eNSe2c39gzLc9uH744kZoujIak40WE87iwYlkcbA";

export default async function (manager, settings) {
  const config = { channel: "zaraz", limit: Number(settings.limit) || 3 };
  if (settings.selector) config.selector = String(settings.selector);
  if (settings.container) config.container = String(settings.container);
  // The site's market, an ISO country code such as SG (ADAG-235); search.js ignores anything else.
  if (settings.region) config.region = String(settings.region).trim();

  manager.addEventListener("pageview", (event) => {
    event.client.execute(
      `window.adagentSearch=${JSON.stringify(config)};` +
        `var s=document.createElement("script");s.async=true;s.src=${JSON.stringify(SCRIPT)};` +
        `s.integrity=${JSON.stringify(SRI)};s.crossOrigin="anonymous";document.head.appendChild(s);`,
    );
  });
}
