# Optional email and password accounts

Carb Cruncher remains usable without an account. Signed-in users can explicitly save or restore their recipes, custom foods, favorites, carb targets, meal preferences, and display preferences. Food diary entries and the current meal are excluded from account backups.

## 1. Create the free account service

1. Create a Supabase account and a project on its Free plan.
2. In the project SQL Editor, run `supabase-user-data.sql`.
3. In Project Settings → API, copy the Project URL and the publishable key. A legacy `anon` key can also be used if that is what the dashboard shows.
4. Put those two values in `supabase-config.js` as `url` and `publishableKey`.
5. In Authentication → URL Configuration, set the Site URL to `https://carbcruncher.github.io/carb-cruncher/` and add that address to the allowed redirect URLs.

The Project URL and publishable/anon key are designed for use in a browser. The database is protected by the row-level security policy in the SQL file. Never put a `service_role` key or SMTP password in this repository.

## 2. Configure email delivery before public signups

Supabase's default email sender is for testing: it only sends to addresses on the project team and is limited to two emails per hour. To let the public confirm accounts or reset passwords, choose an SMTP email provider and enter its SMTP host, port, username, and password directly in Supabase Authentication → SMTP Settings. Do not add those credentials to `supabase-config.js` or GitHub.

Keep email confirmation enabled. Set the sender name to `Carb Cruncher`, then use Supabase's email templates for confirmation and password recovery. Review the sender's current free-tier limits and domain verification requirements before choosing a provider.

## 3. Using account backups

Users can keep using Carb Cruncher as a guest. A signed-in user selects **Save to account** to back up this device's recipes and preferences. On another device, they sign in and choose **Restore on this device**. Restoring replaces matching local recipe and preference data after a confirmation prompt. The food diary remains local to each device.
