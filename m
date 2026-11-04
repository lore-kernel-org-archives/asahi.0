Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789944;
	b=3OA8kDrH5tFmPnacEwiw34ltikP+1AZxRgBiCMxoE9LQOv//GMq4YhH1rAOKzuVzql4R
	 jYpY/UDs/55gcioMCWPyidjDjzsPXgaCgqT+A6sUuAgYxdJ8CKKJUmEyg8zi+TbyLf7qv
	 hhkulliJn7uKVNoP9nt/ejZoPmQpJPLXP4+zr4HPQREVpJZJjhUabGkAbQoN6uSZ+igz3
	 AUK5LAoQ1DJam3WPzzWgb5U1RwyWLJeQJqPZWPn7qg93nvcVzT9VN5O8mn81Qx7or4YBW
	 xY9Pd+9eDm+yEFBX1v9KFIoq8+PNQ8R8sDnnAncKLJZUB3esc+zlV0AMnMps4W4+w/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
	b=uqBoIVyZ7r1auefPqn2lPYsBELwKar7P50BigFh6calgqGeZ76OsbHKCTjGa2jl+fKRc
	 RxvwDA4F1vX+6kRAszgIe+GHQOz38XKYVmBvbIOW2uFr1Kh0lp6vnW8PdQWnvQnPfcsn0
	 BHPSLDB+ZW/+vgIfGbnFU9MWS0PNWhcpeAdP8D9NnXnkBUs9tImk2tthRYn/ih+8J0mag
	 CMutCZPbQuJ94IgYIajv9VDpZy2PnMYM0rszTu4Zuacl9Iyb6KiqWDQ7pn+LDN5AoPNRQ
	 qzPuEhJC8s3GB8xEqSnHMM4N/ExcrZmUJbtbeX8aFbTYaSkplB8Nt0Mpr4SHIML6XXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U4i9/Ryt";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4B606A329
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 10:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F4B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4i9/Ryt
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so888288a91.1
        for <asahi@lists.linux.dev>; Wed, 04 Nov 2026 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789943; x=1794394743; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=U4i9/RytSqnOCzbTWNCKNYG0uxT11FMvyh324V5zhCLrHRIa7W/6Sz7Gw1TUfRy5xX
         DY4sASmSwxhlCstkUYTtvOS5/QA5WNgknpTvyJ9A1iqEbS18Ffs6fAU0Gq0ws5VP45Hs
         +Cisu/Tbk2OK7fXYMybs8jN9GWkjGUCxO3vjHl0Ri2YdWXdNQXp/CCeQRB10f7o/OTnY
         /XV9nLG8hCVcmRD1qBSVU2L2zRb+D5CQ8TevkvEUcpUq/zy47N0DpFjKCOSU0mYCpcgf
         4wI/XjjTRuAROU6XJNPdAdTUswHN8CzPF0pdiT3w6hTNgdwSQ/iUiaSejunVOcUvbpzq
         E2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789943; x=1794394743;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=sqcJq4k9b8XKcSwqU1zurbmIRKD1sd+CM2F7IScAvhKfW5SWCpaBe2GIvUNxyaMrGM
         +wjvZiMVc/iiEXrzb3MF9bJH1JkFAZsRoP5/cM3gog2HVvyKN3uhqZkSpcXSXL+rMKMU
         eFSZQ+7bHRPkEgLebZTZZeOK93BsGM5XpihTTQRXt60zQ2HR9wg8wWVe3awO37jEipyY
         phpUjIemLn0Aan+UZxBhNxJt2HL905afAkUfouj3ew6LBG++wobcICmSB6G6apDBq5IG
         A9E4Z7NHiLtehxa0CD1PeX47IZ/V8+MKAjevCb6TElCT+VHvbRlWx/uOmeQ3rjLhcXsm
         T9wg==
X-Forwarded-Encrypted: i=1; AKwUvBw4cSRN7CtvdrUmgqbAbeomjhp8BCZuik7W3NTb2f+GpBOh0gEnMVhfGDO07Locf9I5QkYJCQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8GJGoK/puPzLx5s0zOywMVNdUbp8S4TPRKFQ3a8yK8gqQ3wcXQ
	j9wRCbUV3y908//TsDnpqhAfua/p+ERoXJbMZMXvpFVutkKnNUxCXlr/
X-Gm-Gg: AYBFou12j4hYLZ/qoh6DFu/oXoUEPHZuYUl8O6NVlFhmFnU/sdNtXnkCfDensE1RQAS
	jhnmhJmbWWcDNmB8HiTO4Th1OH5kdhA5pqXj8wE2gtQ2aXGDPPmBrCm0TGh8M+I6NovsQROjc1X
	zj0hnekntLTB6LoSc6YjFO9siTUoJ1YIqGXcfBPqIJWtMasjWqY4ovdD5+2NtyVVRz5FCm933pz
	6Vts18aGO/VgA0/wWXPLBXXEfzqVuk0tX/zNIm9Xp2xUqNfIj6U1cxzbLbaH+vP/3ewuZBVPUwz
	ZQr+7ZlWWzjD6gNDwVlzWvDO7/IV3k1tYrPeShO4tlj7vMQZKTr6FmRGOUnGPrtTDqsrha5cmX1
	zGqmBDO/auCCr6nZi+WPW/vZdDezLHF3Fsu+MjUHSJdeH90WO3se1D9TtT5yNCDBx0AlCO9lD0W
	u1lPCVpGd4LVBkspAaKBB35A7Z92wbhgIUrP7kBigfF1FoOT1WXA5yq5r/Ri4V4cTYLyLG3E1jA
	AVC1DpUBshWZAmhopOEV2t/ROxFjAuoooOmdVvZpUz16pAu5BoVrtPrAgB/aW/FQ9SHEcxuNGG3
	nrQJ/uZo1WW0WjeCMfaWph2qkzZ1WjBP+RrDD7ry5JVoIVPDKrahiejxickkigLhbQSWKPQROcG
	v9DpjEBPB6yc6CgqEjCX1uE356m8Qk62QX1myO556SnIFP9Ryhzm0szEgxWKX5VT6p5bd0zGRFP
	RgDgQK
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr9431934a91.0.1793789942970;
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm3304868a91.15.2026.11.04.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:58:53 +1000
Message-ID: <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
In-Reply-To: <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261104-strict-precise-mouflon-85cbad@quoll>
 <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 November 2026 8:52:38=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On 04/11/2026 11:49, Krzysztof Kozlowski wrote:
> > On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> >> We may need to define both #sound-dai-cells and sound-name-prefix on s=
ome
> >> machines where this codec is part of a simple DAI. Allow this by
> >> refrencing
> >> dai-common.yaml and allowing its properties to be used.
> >>=20
> >> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> >> ---
> >>=20
> >>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.ya=
ml
> >> b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml index
> >> ab4c7d22dc0e..4ac0af34c464 100644
> >> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
> >>=20
> >>  maintainers:
> >>    - patches@opensource.cirrus.com
> >>=20
> >> +allOf:
> >> +  - $ref: dai-common.yaml#
> >> +
> >>=20
> >>  description:
> >>    The CS42L42 is a low-power audio codec designed for portable
> >>    applications.
> >>    It provides a high-dynamic range, stereo DAC for audio playback and=
 a
> >>    mono
> >>=20
> >> @@ -193,7 +196,7 @@ required:
> >>    - VL-supply
> >>    - VA-supply
> >=20
> > Missing dai-cells constraint
>=20
> Heh, I already asked for this two weeks ago.
>=20
> I do not see how you responded to my comment, dropping everything from
> DT patchwork.
>=20
> Best regards,
> Krzysztof

Given that the binding did not have a constraint for this originally, it
was my impression that adding one would best go in another patch unrelated
to this series. If you think it's fine to add here then I can simply fix th=
is
for v5.


