# Privacy notice

Effective 2026-11-23.

This notice covers every Nabi site: nabi-lang.org, docs.nabi-lang.org, packages.nabi-lang.org, playground.nabi-lang.org and nabi.sh. It says what each keeps about you, why, for how long, and how to reach us.

## Who we are

The sites are run by **DaminStudio** ("we"), the controller of the personal data this notice describes. Write to [privacy@nabi-lang.org](mailto:privacy@nabi-lang.org) about anything in it.

The servers run on Amazon Web Services in the United States, as our processor.

## Reading the sites

You can read every site without an account. We set no tracking or advertising cookies.

- **Cloudflare** carries all traffic to the sites, as our processor. It sees your IP address and request, uses them to block attacks and to enforce rate limits, and counts page views with Cloudflare Web Analytics, which sets no cookies, uses no fingerprinting and does not track you across sites.
- **Server logs** keep the method, address and status of each request, not your IP address, and are deleted after at most 30 days.
- **Your choices stay in your browser.** The theme you pick is a `theme` cookie for nabi-lang.org and its subdomains; nothing is sent to us. The docs remember nothing else; the playground keeps your code in your browser's local storage.

## The package registry

You log in to packages.nabi-lang.org with GitHub. The registry takes logins only from GitHub accounts with two-factor authentication: GitHub tells us whether yours has it on, and we do not keep that. We keep:

- **Your GitHub account**: your numeric id, login, display name and avatar address, as GitHub gives them, refreshed at each login, and the email address GitHub gives us, to send you notices about your packages and account.
- **Your sessions**: a cookie that keeps you logged in for up to 30 days, and for each session when it began, when it was last used, and the name of the browser and system it logged in from, so that you can see and end your sessions on your account page.
- **Publish tokens**, stored only as a hash.
- **What you do as a publisher**: the versions you published, yanked, unyanked or deleted and when, the owners and trusted publishers you added or removed, the tokens you created or revoked, and the advisories you drafted or published. What you did to a package is part of its public record and is shown on its page; the rest shows only on your account page.
- **Moderation records**, when we act on an account or a package.

Pages and the API show your login, display name and avatar next to what you published. GitHub sees that you logged in. Notices are mailed from noreply@nabi-lang.org through Amazon Simple Email Service, as our processor; you can turn them off, all or one kind at a time, on your account page.

## The playground

- **Code you run** is sent to the server and compiled and run in an isolated sandbox with no network. Code you edit is also sent, to check it as you type. The source is deleted when the job ends; the compiled program is cached by its content and deleted, oldest first, as the cache fills.
- **Code you share** is stored under its link and is **public and permanent**: anyone with the link can read it. Do not share secrets. To have a shared link removed, write to [privacy@nabi-lang.org](mailto:privacy@nabi-lang.org).

## Addresses and rate limits

Servers keep your IP address only in memory, for about a minute, to limit how many requests a client may send.

## Why we keep it

- To run the sites and keep them safe (our legitimate interest in providing and protecting a public service).
- To run your registry account and the packages you publish, which you ask for when you log in (performance of a contract).

## How long

- A registry account stays while the registry runs, or until you ask us to delete it. The record of what you published stays with the packages, since other people depend on it; after a deletion it shows your GitHub id and login only.
- A session ends when you log out, end it on your account page, or 30 days after you logged in.
- Shared playground code stays until it is removed on request.
- The registry's data and shared playground code are backed up every night to Amazon S3, in another region of the United States, and the servers' disks are snapshotted; backups and snapshots are kept for at most 90 days. Server logs are not backed up.

## Your rights

You can ask what we keep about you, ask us to correct or delete it, object to how we use it, or ask for a copy. Write to [privacy@nabi-lang.org](mailto:privacy@nabi-lang.org); we answer within 30 days. You can also complain to your data protection authority.

## Changes

We say on this page when this notice changes, and what changed.
