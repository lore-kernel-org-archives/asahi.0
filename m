Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697373;
	b=2puS5QXyM0S9O3h13g4RDEdCL2bZ4FKCx6WTyHau9ofAB4Z2v0syYNUGGHObUBuSVzht
	 HQUkW+g6mjlYvhfPuFW8EzPAGzZGySHdDbGWgccqRsSngsvnhywslV7kkBBNfkBHNTfCn
	 IjLHxVzMhTCYiaxa2uGw4rPXJwYBoAs798m/3jUf1EgUbcm7ct+9thMKXvknGjceRt/5I
	 t+0CMufIWlfF1WK74xtous3E2kDREENXt0fdb0K2mXEEkcBllI5TmVGta6RDHMKCasUDL
	 N5lg78hKCZLKx7fghXxq/PhpnvX/DpObj9eIMVgLyOEYqR6XidOnsqGZldYAQAniFRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
	b=WrhNMNhyZvd9wFReknld/pzAHOG8zsaNRHy+naoA0vRSdTxoluodePfsnFJG30k0Irir
	 Xdali3OrO2yQB3tyCvlNmjFwXRLW/mvMDlv7r7+wZHRI3PM9He3JkEmsVUyBHYiWm2h/f
	 Vth0rl9wU6W4hGauyKBlWZ1e6jWE5Eocy2vPGb3rZEL9En23FVJWQprNRYyuinyn+o7ch
	 YGhic/NNsmjn5mHQ+muR834DK0oRI3mtcoBZW3r/sl0WorxjKOR9q7Zvd39eqQ1RIh1VM
	 xBYX5Bfi7nBphIeBSQVxtI5LQIYmYHEP57Tz61UYgREucIcTvSUtsxgdywjsl7ckLBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HxD4SDC7;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C282606A33F
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 12:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C282606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HxD4SDC7
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4113600f8f.3
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697371; x=1796302171; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=HxD4SDC771eqrE7ZcNCPsLOATNKoAtCzXMeljHuofQrvr0XUC7Q+gP1nd9PC3KPC34
         pMmXzGoq/DJeJ72D0HTYJZ7U8nKnjGJRqQjUhJYNx7kXB9/aDtyj3/1X7EFSo6TtZSkE
         jrLPVDO1kEJ4PNHdHrdivvOO4zQ5q82gGOq0Rh21hnqkbPGT1vkhzBbWlfjuRY7VvDaz
         tSBaJ0toP6a+faN39MzSahLCKM69VLxiQF/cCBUUr1rebhU6y9YB/dC/xgtY3uxmR/zt
         sEkQy59ricmOfbIo8nRSS9lxdTYkJHehB2rYNoiB9G9K5HGDXcDNwaoYMzKZkR9vyIeh
         JlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697371; x=1796302171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=UJOCQp9iiZmG1gebohe38Zico8HkT7SH7u41q3AMhOVGN2W/A4mqffevqbM5KX1sIJ
         lj+jEankPZrKl8XIEY5UDAq3Y6RIFiywTDpg9eqF9sam6AAH567bl/TL6EMoDyvoT/so
         jKg947RXGUmfbI/qTPjbfYViJm2ZUuYaLhXVEXAIFvJ+7s4Q5nF0XG8zAfk2mHkpatbR
         mV2ABZBICUQ2bhYMf94QTpN0JnaXvM1wCaEoNA5HaUDH872gSdL3B2u+B3iqPoxMpUYT
         8L6XS7CWRA/MfibeI4DKXa2l5Skeb60q8RPD05hf4zb4LFOzs0+tyX5IdNMswKX6Beov
         yvZA==
X-Forwarded-Encrypted: i=1; AL+hErExwJmVhS2+fmq1tv4PzHlARI4ef2ah/k3J4NfHvq8ub0xjfnbtLR9EPEDpgggI+Q6LI/cSXw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8KefLjSp4LgJH1nSY0BN+9FPFXWZcuRwXu3AnGMUTtVbBaVR0q
	7WyfnCJkCyKkHGNQE1okWp6qt2HPUJZi9iXS+0GE/WKYwtjRur7HnU74RxykMzxjaSw=
X-Gm-Gg: AZFdTZfc/Djx1hnIy7WaxMegY3DQP0pHMWdgyGlcnH76ah9d8BuCe5UqC5JYPwzgcJG
	YFbG7OlOh1W4GA6e9Pw0XHmHN6GBk4VoLuftbDP9lOwdWrkQevcShZS6EPVVpxu9/mYnnIGwV7g
	AGq6zBvc4oYMVmD7hnGVYWBJG5EN68QzmCEZpTNKTrrkd4KSKoAm3viTHBKGhNXQeiWoaOyviaC
	doUCDX8ml4v5+2k2wDMv7m85mJW/eYBPzaAi5+HFC9OPZTP+V4HV8MkJi3wLbJ0Rt1BF2tq9q12
	fK2QdYl99hMP0eIeP86guBwt+qTiuzT9gwoYobvLq3VStLlH9ZuRqchB5m+j2KJ5hara7eKf4us
	DSvdO2B/1SMmTN0XcuHhNRhJkCwis8Yt3I9DIrBS93S1NalujcOTRLhsVK37VLR1W6xfW1nRJ+i
	q2kORhkR6w6sjeIwSSNY69+OkWokA+FMYIWGokHB66xtqN97F2s716U9FgLDroO8QieGBR34hCj
	34K4KqbpezBSzstblg+70w/X+R8ZEsMLDRViHetqhw0nR1IwfxbqaoPTYzyXUt0zw9hZXu1sPMh
	AJms42CWXvxMA7mnUuoh3ORMCL9RDS3yvQ==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr32707915f8f.53.1795697371481;
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm38969506f8f.36.2026.11.26.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Message-ID: <b1d73b2f842c8827e6a2a0ed6dcb1d0b979265b9.camel@linaro.org>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, Sven Peter
	 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Peter Griffin
	 <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, 
 "linux-usb@vger.kernel.org"	 <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org"	 <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org"	 <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>,
 "asahi@lists.linux.dev"	 <asahi@lists.linux.dev>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Nov 2026 12:49:47 +0000
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
	 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 22:59 +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>=20
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>=20
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> =C2=A0drivers/usb/dwc3/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++-------------
> =C2=A0drivers/usb/dwc3/dwc3-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
> =C2=A0drivers/usb/dwc3/dwc3-google.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-imx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> =C2=A0drivers/usb/dwc3/dwc3-qcom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/glue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A07 files changed, 27 insertions(+), 32 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
