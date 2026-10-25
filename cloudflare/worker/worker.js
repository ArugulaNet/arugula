/**
 * Arugula for sites on Cloudflare but not on Zaraz: a Worker that adds the Arugula
 * site-search script to every HTML page at the edge, with channel cloudflare. Optional variables
 * (wrangler.toml [vars]): ARUGULA_SELECTOR, ARUGULA_CONTAINER, ARUGULA_LIMIT, ARUGULA_REGION (the site's
 * market, an ISO country code such as SG; without it Arugula uses the visitor's country).
 */
const SCRIPT = "https://api.arugulanet.com/embed/v0.5.3/search.js";
/** Keep in step with /embed/v0.5.3/integrity.json (webapp ADAG-206). */
const SRI = "sha384-zA3WSKKc0LPhJbRva74fnPt5eNSe2c39gzLc9uH744kZoujIak40WE87iwYlkcbA";

const attribute = (value) => String(value).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;");

export default {
  async fetch(request, env) {
    const response = await fetch(request);
    if (!(response.headers.get("content-type") || "").includes("text/html")) return response;
    let tag = `<script async src="${SCRIPT}" integrity="${SRI}" crossorigin="anonymous" data-channel="cloudflare"`;
    if (env.ARUGULA_SELECTOR) tag += ` data-selector="${attribute(env.ARUGULA_SELECTOR)}"`;
    if (env.ARUGULA_CONTAINER) tag += ` data-container="${attribute(env.ARUGULA_CONTAINER)}"`;
    if (env.ARUGULA_LIMIT) tag += ` data-limit="${attribute(env.ARUGULA_LIMIT)}"`;
    if (env.ARUGULA_REGION) tag += ` data-region="${attribute(env.ARUGULA_REGION)}"`;
    tag += "></script>";
    return new HTMLRewriter()
      .on("head", {
        element(head) {
          head.append(tag, { html: true });
        },
      })
      .transform(response);
  },
};
