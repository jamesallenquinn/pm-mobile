# pm-mobile

Phone view of James's Project Manager that works with the PC off.

`data.enc` is an AES-256-GCM encrypted snapshot pushed by `assistant/tools/mobile.py` (hourly from the mail
collector and after the morning brain run). The page decrypts it in the browser with a key that only the phone
(localStorage, from the one-time setup link) and the PC (`assistant/config/mobile.json`) hold. Nothing readable is
stored in this repo. Taps made on the phone are encrypted and parked in Supabase (`supabase.sql`) until the PC
applies them.
