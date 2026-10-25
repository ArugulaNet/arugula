# Arugula Brand Kit

Name: Arugula. Tagline: Intent Exchange Network. Regional names: Rocket (UK, Commonwealth), Rúcula (Latin America). Domain: arugulanet.com.

## Mark

A network of nodes and hexagons. Round nodes are surfaces where people ask; hexagons are structured intents and offers; the filled centre hexagon is the match. Edges are the exchange. Gradient runs from deep green at the lower left to bright green at the upper right.

Files: `svg/mark.svg` (gradient), `svg/mark-mono-dark.svg`, `svg/mark-mono-white.svg`.

Clear space: half the mark's height on every side. Minimum size: 24 px tall on screen, 8 mm in print. Below 24 px use the icon tile, not the bare mark.

## Lockups

- `logo-horizontal.svg` — mark, wordmark, tagline. Default on light backgrounds.
- `logo-horizontal-dark.svg` — same on #0F140F.
- `logo-horizontal-notagline.svg` — when the tagline is set elsewhere or the width is under 300 px.
- `logo-horizontal-mono-dark.svg`, `logo-horizontal-mono-white.svg` — single colour, for print, embossing, partner co-branding.
- `logo-stacked.svg`, `logo-stacked-dark.svg` — square spaces.

Do not: recolour the gradient, outline the wordmark, rotate the mark, place the gradient mark on a mid-green background, or add effects.

## Colour

| Token | Hex | Use |
|---|---|---|
| Deep | #1B5E2E | gradient start, buttons, icon tile |
| Mid | #3C9A3F | gradient middle, links, accents |
| Bright | #8CC63F | gradient end, highlights on dark |
| Ink | #2E3A2E | wordmark and headings on light |
| Muted | #5B665B | tagline, secondary text |
| Dark | #0F140F | dark backgrounds |
| Concrete | #EDEBE4 | light backgrounds, page tint |
| Paper | #F7F6F1 | cards on concrete |
| White | #FFFFFF | cards, text on dark |

Gradient: linear, 45°, #1B5E2E → #3C9A3F → #8CC63F.

## Type

Wordmark and headings: Montserrat Bold, tight tracking (−3% at display sizes). Tagline and labels: Montserrat Medium, +1% tracking. Body and UI: Inter Regular and Medium. Fallback: Helvetica, Arial.

Scale: display 96 / heading 48 / subheading 30 / body 18 / label 14.

## Icons and avatars

- `icon-dark` — gradient mark on #0F140F, rounded tile. Default app icon, favicon, Telegram bot, Discord bot, Chrome extension.
- `icon-green` — white mark on #1B5E2E. Alternate where the dark tile is lost against a dark UI.
- `icon-white` — gradient mark on white. Light-mode listings.
- `avatar-dark`, `avatar-white` — circular crops for LinkedIn, X, Telegram, Discord.

Below 64 px the full network is unreadable, so `icon-small.svg` is a reduced glyph: three nodes and the centre hexagon. It is used for favicon-16, favicon-32 and favicon.ico. Everything 128 px and above uses the full mark.

Favicon set in `favicon/`: favicon.ico (16–128), favicon-16x16, favicon-32x32, apple-touch-icon (180), android-chrome 192 and 512, site.webmanifest. Drop the folder at the site root.

## Social

`social/`: linkedin-banner 1584×396, x-header 1500×500, og-image 1200×630, post-square-template 1080×1080, story-template 1080×1920.

## Voice

Plain and specific. The mechanism is the message: someone asks, Arugula matches, offers come back ranked by fit. Never "AI-powered", "revolutionary", "seamless". No exclamation marks. Sentences under 20 words in headlines.

Three audiences, three lines:
- Assistant users: Add Arugula to the assistant you already use. Ranked by fit, no paid placement, anonymous.
- Surface owners: One tag or one bot. Your users' questions become revenue; you keep a share.
- Merchants: Tell us what you sell in plain words. We put it in front of people asking for it. You pay on outcome.

## HTML snippet

```html
<link rel="icon" href="/favicon.ico" sizes="any">
<link rel="icon" href="/favicon-32x32.png" type="image/png" sizes="32x32">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="theme-color" content="#0F140F">
<meta property="og:image" content="https://arugulanet.com/og-image.png">
```
