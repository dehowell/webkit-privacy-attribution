# Seeing WebKit Privacy Preserving Ad Click Attribution in Action

You will need:

- brew install nginx
- append the contents of `add-to-hosts` to your /ets/hosts file
- Install Safari Technology Preview version 82 or higher
- Generate certificates for nginx SSL termination (see below)

To test the attribution reporting in action:

- Run `./run.sh` to start nginx
- In another terminal window, run `log stream -info | grep AdClickAttribution` to tail debug log events for ad click attribution.
- Open Safari Technology Preview
  - Go to "Experimental Features" in the "Develop" menu and enable both Ad Click Attribution features.
- Visit `https://search.example/` and accept the certificate.
- Click the ad link to navigate to `https://shop.example/` and accept the certificate.
- Click the "Add to Cart" button.

For more help troubleshooting, see [the official WebKit docs][1].

[1]: https://webkit.org/blog/8943/privacy-preserving-ad-click-attribution-for-the-web/

## Generating SSL certifications

Run this command in the root of the git repository:

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt
```
