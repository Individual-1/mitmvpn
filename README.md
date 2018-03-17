# mitmvpn
Use an OpenVPN docker container and some iptables rules to forward traffic to my local Burp Pro instance

## Why?
Some Android apps seem to have code in place to detect configured proxies. Others won't use a configured proxy for all traffic. OpenVPN takes care of both of these issues, most of the time. Using a transparent proxy (mitmproxy, burp in transparent mode, etc) then allows you to capture and read encrypted https traffic, given some additional steps for trust.

## Setup/Usage
1. Pull down the kylemanna/openvpn image and follow the Quickstart at https://github.com/kylemanna/docker-openvpn
2. Deploy ovpn to desired devices
3. Run `run_vpn.sh` and `start_fwd.sh`
4. Have a transparent proxy running on your host listening on port 8080

Note that the scripts are set up to forward traffic to the host and port 8080. If you need something else just modify the scripts, replacing `172.17.0.1:8080` with your desired endpoint.

## Misc trusted cert stuff
This won't solve the problem of getting a device to trust your certs. Here are a couple things that have worked for me:

* Magisk + MagiskTrustUserCerts from https://github.com/NVISO-BE/MagiskTrustUserCerts
* Modify cert in package assets and rebuild
* Frida + https://codeshare.frida.re/@pcipolloni/universal-android-ssl-pinning-bypass-with-frida/
