Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790001;
	b=yNaJwI7LI3eZtGP45jCU6eK/MqYGzbKjRclHrGgKc5sN+lcvjhjwQd9kPNsoGALFDkmq
	 5sevCHcrg7WEoFp0eAiT4qC9+86c4EnEQiTqroHsIPgUjkgo0pYeioRQsyLdYtElP0msl
	 v07RHTGg0w69BHC8gXJK9GoNXynV+d60phcNbpmEl6hQl2Tr/YOAcA234Ni+ZdQL/lwAN
	 HpOIPJ09H6cO1rn+Wkp4kM6lGREmWV40hggqfYFcK9DrxMcZqDU8uPuNHudn7BAY1yHzS
	 g3fKQYTBYAK0H+HnF1BWopxAgcmHe5ve7B6QzWEpV40Kr3HfpKJx7puPf0AE+THkJrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
	b=s89nf2yqkYMKPAmZwp3bFCC/4l67/DIVWMlOKYpNXPO94LChK2822IugoZd00r2yyyYS
	 /dEs5Mzj0qT6QyMxz8RGklOLZDzAhIHHbnQhUyRniFJ+DIIzBFFt21BSDJDWGmb4KT7K0
	 alBmbcTPocskKYzH5ddxlMxrDcAG7Th9/9cb1hg2svS8tAg9iZJIlksQtsNUsJes5lGQO
	 tY4WjeW2dRV/diwRoS9ZwZ65C/PX24GoPhWbBamhwm8eta1spCUFn15y/b5DVGREFqnAa
	 zuCn4GUOD9gj/rauaZe/P6Y2kW7pyCAeF9fzft7eReQViULVdOzh/mKN3p7Aj1c4sjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MkT7S2d3;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB0606A326
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 11:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MkT7S2d3
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e812e2b31bso2982695ad.3
        for <asahi@lists.linux.dev>; Wed, 04 Nov 2026 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790000; x=1794394800; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=MkT7S2d3XBtmKG290BlYuYU9PkAeelrCLdWS3s5kCJIvCzPfF3rHBCNEkEG3RTNTHm
         LRKU/g/DX0XuJsLrZzeyHdZPlLgJ4QRHF2/5NVajoyCXGlfaPXcH8DFAHJnlVfBerI5g
         6osvfViz4gMdP+zEH5dD2zDGcV1TykPsBoPBuqajplkbdWYfJJwhLkAzzP+fLTj5/GJU
         3MaAqZeX64ozLvj8VlB60cB33Wnn5JO4cxVTe1GYQNH3gBTUJXxxXqxfZ38gNgQp92HX
         fD+Wvrp/8lwsUlgUnNfmlZPjkO7hLKgIJb0u1+r/66RurCpmsW10lPTpyLlvIBiVg5mK
         I/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790000; x=1794394800;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=Z/pFNsEPSzLJq/5EpIlR++t9vXTsLFGkQsFIK65gvrxrJGxCOoPtmp3nmgKeqyetfv
         uF4Ue2cm5FoYHk95GKm7kEB6hyMxwIjXOP0rBvPA0Zc/GESbGZXF/Kd7ovxc8/lFoJGL
         Zoh06eIIy7zkNxlW0WCdGQCXUeViEN4PNAKEvfVF2ogJeVq6ENjC0hagF8DCaYBpxBK5
         Qtff2cTiIpfbJ1bMuCYoGz3Q3ADvfPsU22NnhdwfvdRBKlB/Ez4hY5iVkg3RZs+CJRLD
         +RUemx8Ls3sdlTB/vDFMUXmASOHNrZrLH1asvi1Vp1oO/JrB14GwmQ/SVMcUSE6BUK08
         xUuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiiF2Zn9iJPocYQv4pn7iQXUw+zoGXwv4+muXQoXGTPLf+Xtxvk3FAe2SSYR+SvP9bFobKqw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/q2idTuhXg+mJhS+nLNniPaXqGdwavAf6aWkXkuUrCOCR9chpB
	Q6k49hafqr3HLEkRIKh73HpWBj44/842hGt/ysJml74xZPsSynycceNB
X-Gm-Gg: AYBFou2I77B/Byhe8CmetcG+BJtxxnaV5qNGw6o77ujX8qm0nsW+gdbulbqqYwzvJmP
	bD5d8fPPASVaIJgF7gRDdHXxX/pqGdYk0N68exZGBdZtYwBRW5+phdPGp/xUkWAolmTY+RE2hKl
	1c8p/Faj3o3osw39GQx1s//h8jyeQAQGQrPX8cGNyvdhOjkKwVADfI3Ji5MHxDbMB6zJd8fhob/
	RBExXCYny81B2UY6yz22J1Sw48SIO8jsz2D5YTf4S8pK+K6av0brdM2dxQmpW8MtWRsMnWTifp9
	rFa7KW7769UpkTBRqQrSy5yZHixK6KW68Bu8308kPlkf55e+YXtPzfr3j0Ky5nZ3stuDLnr+hhm
	dznmeV2Urd3n5LHczDFDkVEkpn3U/2HMlTaeT4XMS8GXe5NWqGlbIuD1OaZUmWQraryTN1CvcKZ
	ktqFOogewDxGLpCuof5Ya50JcaqtcILLNPt1kIYNG3fuy+qVNmg3NImO7h7X/O4gov97reaOQPV
	a1zxA3UZ8LVQio9Ickasqtaxrflqceck520bmjLSy9sop+nCcpkDosAO+Cg6YgvebpTJVpnIEeT
	hM9SOGmMeVL6xh4ASySXdNw/gGVN7q9ZWoqnjSCORo180SEKf/B6CEvxxAVUu6svVQFROVmEZLg
	TIB4TTBu8NfdHC1bSiRl1UMH7RnI3mFD/NatNBbPMbOWg3NIqL9yKfIdw9vQcMwLh58B6YRlr4N
	zSZHyYoBVojNHS3o37TmEGpt/jJA==
X-Received: by 2002:a17:903:1844:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2eb364de4d8mr153487635ad.37.1793790000537;
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm5843875ad.45.2026.11.04.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
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
 Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:59:50 +1000
Message-ID: <nYufjgFVShG0c_ndRsefxw@gmail.com>
In-Reply-To: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
 <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
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

On Wednesday, 4 November 2026 8:48:25=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> > Some consumers may wish to prepend the codec's name with a known value
> > to identify a specific codec among many and set #sound-dai-cells. Allow
> > this by allowing referenced properties from dai-common.yaml.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++--=
=2D-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml index
> > 94062c1d9d45..66cae8b7db5d 100644
> > --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
> >=20
> >  maintainers:
> >    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >=20
> >  description: |
> > =20
> >    The CS42L84 is a headphone jack codec made by Cirrus Logic and embed=
ded
> >    in personal computers sold by Apple. It was first seen in 2021 Macbo=
ok
> >=20
> > @@ -29,14 +32,11 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >=20
> > -  '#sound-dai-cells':
> > -    const: 0
>=20
> This should not be removed. Why cells of 1 would be correct? If so,
> explain in commit msg.

This was unintentional, already fixed for v5.

>=20
> Best regards,
> Krzysztof

James


