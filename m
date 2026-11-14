Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794616793;
	b=qqKMTCQuuJKASKn9d1m8/1jYi35/H95/5qEQbiE7Zi4citFzbnXdXJHOpYnGzTLE4ECR
	 F5LukXYfRd+YhgM2rdaFvXJn0/8RvRxhxT5mUj1K2TFE4u2d9UYdl2Edk4tt7AkJIFvGw
	 m2IUyQGl3jHOvxQ/ij8KlbWvPiZmNuZMH7DIjbw4iSFMeEq2+t/vQ5PAwkYRL2rnpAVsU
	 /52opBY4rXzOHeR79pHWWfo/9m2WamgoFulSSCMNBRKBpj2a89sje2AzXHCyyHUI0gMge
	 hyyU7bplLg+3Y1D2IWfI3/ESkthLA1XcOCkwAho4y2Ym1Q192sBEt/4ObGUTdpASnZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794616793;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=Sda5AtOByv6tCqYB0uGILQucg1ieIGsLgGYt6+2/6xg=;
	b=yUahj2B+CBhUy3NH8z9hEWUU+R+oa0fQrHQ9Fn8Omh6CyCyGwPkKV/DF3Qywt95CGxA6
	 b1/UU/bW/pdtqwCmDc2Je4QVEa7e7n2/aL0I5NnbhtIphOlx3UOPwguPrhr2kS87oi4o3
	 qYVV8aVqwtAfEKifgomH3BQDZqZBg8+FGybw70T3AsgjjmVsFMitcaNGtx/th6PicTfFd
	 LnR9TQ2SrKYK9GBpLxfgZ7w9uVJdbI/u8S2kmoi3/2jRUWOkIFf82iH9fWX6SJNfuM55F
	 WHKAbtWG8yeG5dJL5ulzq5RH2TSLBjjb7adzVbbZ4FOXYaHYM09t/Z7DadVQf4U93rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CGJeF3NP;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B099606A331
	for <asahi@lists.linux.dev>; Sat, 14 Nov 2026 00:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B099606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CGJeF3NP
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so775307a12.0
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 16:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794616791; x=1795221591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sda5AtOByv6tCqYB0uGILQucg1ieIGsLgGYt6+2/6xg=;
        b=h7TDnV+2ffQvmAwdVhN1N8Tf43eQyyoNze4xbR60F5Tg/1nulPHLFXb7kcD7OJAm5n
         UePH382eacPX7eC81j3j23TfRwWJs+7SXIjVXOarFW5pfx/O6/z5EJqNNkAR6qWuEye/
         6Vp28LWw95WmjZTtSPPTcU+zkMFwDDFZY5Xymz02SApQUfOCKP8m1FrX5SeHAOfb+yFz
         4CWZGZJh9PYsX8Vms1RN2ag/PBkJixe7vvaGyWmF0D4EKsnF/pN2CZ9CoactPlJMhM3Z
         Ke4tIrF/HRpxn/3wraQvAJvpmJL80Dj6kjYfPDqZYoE7pg0PNeQ9xv9TaN4lQ9VXQxFr
         CeAQ==
X-Forwarded-Encrypted: i=1; AL+hErFNrHF5c6V1wf23p9ovRsGucovf7PIjU6LgIKcsjdEXFBvnEneD81RYCxnOaauQ9AE/MRZevw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8cfwMaFu5zF9WeT+tvr5NnAflBneutOiJ78G1YCplFJjBCooAy
	HYArBsw8ICULItykpFaQBFGuR40YOqOHWLczv+tBPAzc98mflqHPSBHPqpuUxMxcppUXk3eZY72
	GL0z7XITYnGytkaNvnbB5vX4n/HiqGxFK/E33AjQMp2HN5vhH1JE/cjypFID106z0CU0WN0d1Wq
	oy30WHN5VKb2satipvijkmGxp1gP23oBxKHhGjzvZKs7/cBj+g5KiQdgxLkPOYLXbNZP/IJvlF6
	4I9iY93jZ0=
X-Gm-Gg: AYBFou0iHmwZOERm5TUTq5s816l+ISF9SVvV3V+Nq8csTB3D1jwotaRueg+1JtUVHE9
	OKTth2uxkgsPPZMKyHItdvuRCYo91EUiJ70r3kb4zkmEpApQ6GcJJFBVtcVJVeUlbP/Vm0htB6K
	A8iEgtoaBjvOKXCA/GJHgmg0KjoEtfAYBdzve3ZtnaQ8qNzSqCHYfqF1rprA9vth8fzeCXjM09+
	Ky2qIZSny9bTyDhVI9NGnLCi6A3t5OzGlECBSIUq9yPwnlqs6M5OGdCwQlALGLh//nAKkCI8b2T
	PzFrbGcXu13QgxROEIZ7k0H7yGU+etopR3KYvM8ZaR9VXDu3mimCmyqqwDDy0woHS/RFRyhwRlO
	ZzhPJ3rkf545LeRSc0mJyHZ9pb9H9Mb7QLnYsM2GL6U89zKvLCC0imZHNXBr0k4NDCSp3xQyDki
	BDjCKQW1IkWSHDO/EC+Gj28kLh3Sk1bTbRTKcV
X-Received: by 2002:a17:90b:4d10:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3b1b07fdeddmr3591894a91.9.1794616791279;
        Fri, 13 Nov 2026 16:39:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cca69asm8545060a91.5.2026.11.13.16.39.50
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 16:39:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67c58f18a42so2141324d50.3
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 16:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794616790; x=1795221590; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sda5AtOByv6tCqYB0uGILQucg1ieIGsLgGYt6+2/6xg=;
        b=CGJeF3NPGV1yg+lWJ+cOL3Wq2Q4CKx9gG79c77KyTPjQEAdfnlqAz83j03EgruNu1R
         2IBK6BI9DRreMg6z6nJvCzZc9nsU7MZV2EAYsnuDxVBQXvHsKR/ergiQ+LkCDYEwD5lT
         SLOF6hMVIGqhu4Lo618vR1WX0SQbIYA6yAR8g=
X-Forwarded-Encrypted: i=1; AL+hErGaY1/3Gq1H5hk2Xc+BZ5qcxQqWsHympzc6x8sPzpLcB74OwOEiwkzIdOeVdD7CoA+MJwH6nQ==@lists.linux.dev
X-Received: by 2002:a05:690e:11ca:b0:67d:927b:5cc7 with SMTP id 956f58d0204a3-67d927b62b6mr1064871d50.63.1794616789913;
        Fri, 13 Nov 2026 16:39:49 -0800 (PST)
X-Received: by 2002:a05:690e:11ca:b0:67d:927b:5cc7 with SMTP id
 956f58d0204a3-67d927b62b6mr1064860d50.63.1794616789554; Fri, 13 Nov 2026
 16:39:49 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn> <179460764342.448985.18219249061160291658.b4-ty@b4>
In-Reply-To: <179460764342.448985.18219249061160291658.b4-ty@b4>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 13 Nov 2026 16:39:38 -0800
X-Gm-Features: AclHuK_R93zMx5JdIqA9R4YFk19f5vFBEjNV1ogvvEgejiFz1GRdDNuBkvJS7CI
Message-ID: <CAHi4H7GnDJPcJ2_DD8GGuFjN8mZsGPVWRCYzfCwywQeh26-=Fw@mail.gmail.com>
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
	boundary="0000000000004912ce066031c8cc"

--0000000000004912ce066031c8cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, Nov 13, 2026 at 4:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, 10 Nov 2026 23:34:50 +0800, shao.mingyin@zte.com.cn wrote:
> > spi: fix division by zero with a zero transfer speed
> >
> > Five SPI controller drivers compute a clock divider from the transfer
> > speed without checking that it is non-zero.  A SPI device whose
> > max_speed_hz is zero (a DT node without spi-max-frequency, or a device
> > created through the spidev sysfs new_device interface without a speed)
> > therefore reaches the division with speed_hz =3D=3D 0.  The SPI core cl=
amps
> > such a device to the controller limit only when host->max_speed_hz is
> > set, and none of these five drivers sets it.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.=
5
>
> Thanks!
>
> [1/5] spi: sifive: clamp the clock divider to the register range
>       https://git.kernel.org/broonie/spi/c/49071cdbecd3
> [2/5] spi: bcm63xx-hsspi: fix division by zero for devices without a max =
speed
>       https://git.kernel.org/broonie/spi/c/82ff536b6049
> [3/5] spi: bcmbca-hsspi: fix division by zero for devices without a max s=
peed
>       https://git.kernel.org/broonie/spi/c/167fe08d3ba5
There are still open disucssion in [PATCH v2 3/5].   If we want to add
a clamp in the controller driver,  patch 2 and 3 require extra fix as
discussed in that thread.

> [4/5] spi: apple: fix division by zero in clock divisor calculation
>       https://git.kernel.org/broonie/spi/c/ee22df21fdf4
> [5/5] spi: atmel: use the maximum divider for an unspecified speed
>       https://git.kernel.org/broonie/spi/c/51953948d6a8
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>

--0000000000004912ce066031c8cc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
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
LZFCjP7B4eWNV4p4bAsKClYp/L7CCgVfLE9Ck7WCWm0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTE0MDAzOTUwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEANU+g59Ym8z2569oD0lWRL9hfRWZht20X85Kf
tUuDiX+aucfhpZ5VnDaUL01+DSy/fXvm/6hfxuRw3PpfcU4DAVeG8A8Up6zZfJDZDtvaMDMmFVOE
xabF5MaL1V+gADN6OpJFADJlwR6em1c1nRBRqf73efwSG6neWfq3174P4S2MOiaAQG8MmScd9nKZ
zX8Xu5y1yv5McxaTmAX1+1d3JZg/hn7xGpP3sv+zsgf7yRR4l4WwPe/WWzMB8pwpcXH+Iaoc+2Pw
4pGUfMCdl+FrKzFdGh+Y4nI6D5Tip6+59Ir+PQYvrGLy2EsiAr5tase6zEkWd0+H7ekGD8UXzeVV
eA==
--0000000000004912ce066031c8cc--
