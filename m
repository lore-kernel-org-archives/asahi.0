Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618682;
	b=4nDNTl1AaIHhX1Wr4TwVZVKLLvlLYKcfkgk2IBU5sr4rzR0oesWnQ2F+O2emjalZoUp9
	 Z08SyL0w8eYY4ViJX5P21usfaQkiSx93TtMBmzb2WcTrfQFflfEQVezF7RVp8dkSxzfsF
	 cn3Uz9sxHiL23Un/lLG+qzWnHGNZqdkOu8veBOfLib3M1fT89wCFGQZGw1xljljofhvYh
	 sZt+Pvo2LyuzsEV1Fpgl6KelAHJasKkel3MS6BWiokWRjG9VO/xpIuCo+6zVkr7wjV6yd
	 B5DNPOsKXaypInmtUPEw8TAYgE1rAxSombW+XsdZF/rArkUuBJTx2tJPd8z6K4YKu8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618682;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=ENTFWA3nbeqNkDpFGZ/jfbKCTQIvqpc1C9bFpgR47UY=;
	b=JJaGudz5WYnFdEN9+60VhJCu2aVO9rWzF1edOgRHf5XEBRyuEvQCjXu8zbcppTknoO1Z
	 y7vTFYe2QflzUK+qFRq5fTcVPdYSfBbUSrvfcWOVqz6YW3Cs/2DKQPufks+jFb4l2WXoZ
	 hswZeERXS1sKquaMOyc5cffdCWyu2WLJq960t6XIP2zaVwqc0E7VWtAzTczqIfMNJmgFh
	 kDFlrJAVJyUh2CyQz4fLPmWYp853/Oux/7KwUGuBFimLw/AvW8WeFAmQhbN3bAj7hbMZU
	 BgWYlUi7hZ24VoIAgp/9UL4VFQrnLA8jMvoyvCzc26dM6xt4l5hpDGwgNDES4D7J7XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CjGxSBDL;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C7B606A32D
	for <asahi@lists.linux.dev>; Sat, 14 Nov 2026 01:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C7B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CjGxSBDL
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1323336a91.2
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 17:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618681; x=1795223481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENTFWA3nbeqNkDpFGZ/jfbKCTQIvqpc1C9bFpgR47UY=;
        b=oVRJhExhgj5+/lQ6DRlC4s/imJX8R2A7hxuQG89ZS4sXDCEyovHHkUsm6LOthd+auf
         6Q4Q+/JynCy4wD6l2oi6pPASvVIAevLZy9s1eB1xaYqT+2/GlCYFBXtOh399e5YUvIk/
         0Q3UXHddlFTCUamo4aglwxK7j+3/UU2ZUJn8MwRQ6idht19EaQUEm2g0I3BXxTzRSbnP
         XmYoVnhQBR6rRlGIoOgQAnW3IEj0V0F3f53XlbdhRaXmRO3EVwseRdA8xM7DDTM+/YOq
         2hBE5gD4lLvufrQI7/FTdOCfMVuhMIptz2IB3I+3zp6TYa6n3UGZbbnVCe2Cx0BjJj7s
         0Fzw==
X-Forwarded-Encrypted: i=1; AL+hErEbmQ9wxdMJ/PQk1l39lD6lcFjIqL1VpT0tk4UjhvGPWLk6Xyi2t7PFHSS/fuBrhLxUSp/FEA==@lists.linux.dev
X-Gm-Message-State: APuU4Z97pkbeLx9+VvD/pyKfBqb42dlUm686IW2PaNyGtRUECWNw6jEe
	DPYyc7wMb3CEYmvhQLrRSOhMUdc0R1F7Y0wMACAb4D5yqtvzEKKA9DWodZi72GSjvK/Luhwo3nw
	h6JZ0TB2dfdKVJjf6RtKdFXP5jWgI/wYG+gWG9YI8MyfxqcUYOKYz/Wok5ePYnGbXppgRAZmxJM
	vksEEg4zuKwUhdkh9kNU/jIPYwyp6gOQVlHQCvjleCFRLjVpgy2H3OAfIUXrdJ+FBGmoFOF5FCh
	upVT5TOVaA=
X-Gm-Gg: AYBFou27+OlqL8qDQr5rx1/VvAl0LPnUR0fQxMoQRrd/P6vSK5V5ZcF6u75WOWqGgsy
	YL2DF/JVZPSGAy9YbdsJM3GfdQby51nOSz193Vt9Bj67AbfY5HE2ZflImAz0YC3k5AnWfdAUfxP
	ttpuiG4YrtKsVM8/2KM4S65FUS959lOOBYC6+9ES6M3teXQBBS0jYJujIAMo52a0iDxIVbTj1BG
	v/6WWTvuNsNfIQr3Nae+pBGfXz4s/GZXEVpc0YM7AtAwCF3NCpDMWGOBYji3R/+L3SpDYiRafEI
	FT8otgrEvj64Wp+q6Shis21Rno0WvjaqVKAXKUTP9sC7mdbRrvSUK/3K2tmAEP43+fNGcxn8CSx
	1hP9uTUaKzJHc2i9TkZndx7/nQV2lpRc3Yl60268cUmZIfe42tNohS8JHsSi3
X-Received: by 2002:a17:90a:e710:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b1b0a0db93mr3816924a91.21.1794618680919;
        Fri, 13 Nov 2026 17:11:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3abbe1asm3075012a91.5.2026.11.13.17.11.20
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:11:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677c4ca22c5so2993381d50.3
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794618679; x=1795223479; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENTFWA3nbeqNkDpFGZ/jfbKCTQIvqpc1C9bFpgR47UY=;
        b=CjGxSBDLwU6a7IrHf7P3F8uOs/PVGgzAI1OSZnNkTQ7VYq+QlxbW4XUOyJB1mKPhC+
         6GH7SNXdYEbak3KyVdsKAKhtOmpj3rMHgN/5nKWTPloGGhEX3rusNBen7kojynhtpE28
         ftiZ8ipSTQzc8ufQanR0A5MBwkPeR8tUEctLQ=
X-Forwarded-Encrypted: i=1; AL+hErE7qh/3ssxEYBNVfXJxkFBOpk07VBq4RxO+xVJjYS3ZhU2+QVVy5xi3eVnwOFnjQzSBRSy8Tg==@lists.linux.dev
X-Received: by 2002:a05:690e:1a63:b0:67c:11a9:bbe1 with SMTP id 956f58d0204a3-67d897cc261mr2027051d50.105.1794618679237;
        Fri, 13 Nov 2026 17:11:19 -0800 (PST)
X-Received: by 2002:a05:690e:1a63:b0:67c:11a9:bbe1 with SMTP id
 956f58d0204a3-67d897cc261mr2027019d50.105.1794618678694; Fri, 13 Nov 2026
 17:11:18 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
 <179460764342.448985.18219249061160291658.b4-ty@b4> <CAHi4H7GnDJPcJ2_DD8GGuFjN8mZsGPVWRCYzfCwywQeh26-=Fw@mail.gmail.com>
 <7730027d-d89c-4b7b-b8d8-07bb19e95061@sirena.org.uk>
In-Reply-To: <7730027d-d89c-4b7b-b8d8-07bb19e95061@sirena.org.uk>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 13 Nov 2026 17:11:07 -0800
X-Gm-Features: AclHuK_EMiaoaPMcQuQramJRoDPRg3DeRM6BsQ72-NrHDXofnwmw9SQxZQjopP0
Message-ID: <CAHi4H7GxWGABxc7q5dhamxchsGnMReR+KzXT4VxVRX9mVXc7QA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] spi: fix division by zero with a zero transfer speed
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, shao.mingyin@zte.com.cn, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, pjw@kernel.org, 
	samuel.holland@sifive.com, kursad.oney@broadcom.com, jonas.gorski@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, 
	linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net, 
	neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e6eb0406603238ac"

--000000000000e6eb0406603238ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Nov 13, 2026 at 04:39:38PM -0800, William Zhang wrote:
>
> > There are still open disucssion in [PATCH v2 3/5].   If we want to add
> > a clamp in the controller driver,  patch 2 and 3 require extra fix as
> > discussed in that thread.
>
> Ah, I'd missed that subthread sorry.  It does seem like something that
> can be dealt with incrementally, none of this should be triggering
> unless the system is already pretty confused.  We could do something
> like have the driver round the rate up to whatever it's minimum is?
> We could also have a min_speed_hz in the core which would help, I
> could've sworn we had something already but I'm not immediately finding
> it.
No worry.  Yeah we can set the minimum FCW to 1,  it just can not be zero.

--000000000000e6eb0406603238ac
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVXQYJKoZIhvcNAQcCoIIVTjCCFUoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLKMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGkzCCBHug
AwIBAgIMPaigUjJ79aI7cqBlMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTEzNTIwOVoXDTI3MDYyMDEzNTIwOVowgdoxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFWmhhbmcxEDAOBgNVBCoTB1dpbGxpYW0xFjAUBgNVBAoTDUJST0FEQ09N
IElOQy4xIzAhBgNVBAMMGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMSkwJwYJKoZIhvcNAQkB
Fhp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBALBa4WsRxbnpowbqT9/K1B0+Fmm/xDtPPHKbcdL+yvZ2PemlfcBwapeHvbu53TO6TTBCtmSi
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
hOA/jXxkK0m2EPoh6q7r2kzMSY//cAHV23zgexvnMmYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTE0MDExMTE5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAZZPuEEXFOLLrAvxvZbbULIo6pzZ0MhREvdmj
GwnrS5LHFbvIZtT1sq5ezZ5E66B5Xtca/YdEXKKh9/ycnX81Xoo3UKGsr4SFLDqAoHkQPbLLLBxf
08An7KemobViZe6nPWaAimL6QNGPe93lYUjMys9zc3NMHv2mxffF/zlkEUMU/4XhKt4ItIjvo1kC
4bTKSSjwv5v1h3Q6WX9xIzYoKvOmNKtuLB1FTGaskCxC93jbblM3RznKOxKPH8FJ407gTxtUj2Cv
HoHtY/xmu+UNtbX5Zf/MKokC/t35zwpZjFeKYbwbVZLRVOLfS+beyhOVaeDdF2WPjpOBy+f+eJbh
uw==
--000000000000e6eb0406603238ac--
