Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3C32C92A
	for <asahi@lists.linux.dev>; Tue,  3 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529061; cv=none; b=ViRNMCrSDquZAkf4TmJ0x4D7qU/8dyQT4u/lM9USFGz8ynIQh+lzfjJGCk9WIVa0LEjfPR/36gnEp/9HCYfUQkcDnoKpnvIhDwXIjAWul4vrRnvlCsw+ldNFoIhoU7tj7OScdBbhgVpQjMIBoyb8w3R/ULlvqJRshcdt6MjJ+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529061; c=relaxed/simple;
	bh=w8Kx1qlt4D62VcByjefxrRx2gnqxk8TlOdvwp54Diog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gM2MnfO3rHmg4CP6McwktNeCq330wtwnNSdHX+QFldg2eKV7vNHJxrdssv3NvxLih9lJdzJYbq7ismj227kUAgFvi5YKdwnr3s3IDo04UNmmZn6qQxdeb7NQp1Vmq6U4Vhsxic+xBTG45DPSrO1GwfOuhH74JlYa6ah0e5kSvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlAZfsK4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlAZfsK4"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-827307b12dfso2931217b3a.1
        for <asahi@lists.linux.dev>; Tue, 03 Mar 2026 01:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529059; x=1773133859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=RlAZfsK4Q9mKe7Knvr+3o2BSXvCJ+kiAEUjHcbYVB7ZhEGZpWzpmGB+aOrYd/Ky1PM
         YFnBHXS2+SOXJ12HgqbfUTpX0cBJzQygZDhzLad7aprw5M685bMogqx827Y3mg2SuGsU
         /QLkiECLp92JAvgUJccMMoVJ36Do8EjmvWb9WorvxmQAeJ4k0niEuYe+fM6fNUDev1W8
         SvZpRQhUHg0gtNUBKOFyssHKEZxWcbVe81CfHcxzRJVcvrbaJPEcmZDmbwdLd3nk4ooG
         26u+93d67dodldAyLa1o2MPGZlcJOeZMMvluP55Jnn89T68EidX+F0wRjdS+d3teaVTT
         zS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529059; x=1773133859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=g06gU39BnIbYD/91fL0NSDG9vg3hZK95Yqs4NbYu97sXNulC1HWErxvAkuVsZ7X+Az
         cAZmj3KPnWhQlLm/XKg9/pAD9fk4PUAmf4FB0zAgkgPfcgD7EXKQckfAb5epNy54Kc7+
         iC8vZfFxnTrBKL0ihsHrAX2Umgmod+ZhAF2kl3TU37VjjfXqLQSwhYeLOXaU76qR8EBm
         meM4g4aBIzOtJRtkTmpBdvPmgwHnRqPPop9DJntPl7dn3+kZiiG6b7jcesbv08NnXBgf
         W9qBDG65eqQD3p8qZHXnH/d1MxFVChN3lROEPD8kGs61GBCo8Cd0jebVz3Gj/0Trv//A
         GsyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPgwUGABdgT3tYQL28UlJVmL6I+U6vfQRBKQ6UrHbaFlXPnkmT1e3LYhe3bpfs3z27Z6NYpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSUyavRyN12uhEZHTqAwVtEMU2ro/g5aAsSd/LaAUYTLr3r/Eo
	zAoeUbVqPVQRMOLynMip1v+XLjjvp34HnM0FyZNPEuF2Xo7RQHaTpAee
X-Gm-Gg: ATEYQzzPw0bxdB1+DcWPNwP3bchomIGXnS/LhbeKlcGTfKHy8PrvjWfLkyy081AyUxx
	xmmtAPdB8zNMD5ILsJO8iCv1U1vGF+93zAI2cN2vAPO3BDQBtDM6tmVD5VjUGspOO9l7Flpkcgl
	t5SYTFjsx4xxOdoobzprHJBDir3l0hwGGQYMhUhDL69ScJIaIif80HRlLLa58OzFdsMA3v8jBYo
	35NY2Kvd7at25vTjGSkdvUliqO6qL07VuCqvx/3ZEDLt5bzmxf9c7c140TbQ5Qztdi3TKa8BfTZ
	m7NIoVBmojhIH6H+Rjqlf+37Sh+jf35g8W6iofopZuPglC1UajKVCP03yi53+DZoXV8qOnAGHUY
	r0c9Y9HkeZqbUS7GQeo2Wu+SAQlo1Igm/UHNOxI7ovmX+qw27DkvQSjeMu6RaWMowuit3/hzmmY
	v+DSjDv81XFK/NKj78m/CHvXaGfFEsF0j1bOUtEje///mayw2HFFesj4r4NY4IBQ+D1MtmT5y5b
	DLR89k+LOz0mzdlvov2zzlQ3P242fpDmp37nCvlOP3HybcukAydsWTyuJvfMFD5Sq+obvcyx5Rx
	S8A=
X-Received: by 2002:a05:6a00:1ad4:b0:825:2927:3aa6 with SMTP id d2e1a72fcca58-8295d82a9abmr1551612b3a.14.1772529059400;
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db4955sm16000114b3a.29.2026.03.03.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle mode
Date: Tue, 03 Mar 2026 19:10:49 +1000
Message-ID: <4716405.LvFx2qVVIh@setsuna>
In-Reply-To: <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
References:
 <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
 <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Kuniori,

On Tuesday, 3 March 2026 12:11:50=E2=80=AFpm Australian Eastern Standard Ti=
me Kuninori=20
Morimoto wrote:
> > +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> > +			     unsigned int tx_mask, unsigned int rx_mask,
> > +			     int tx_mode, int rx_mode);
>=20
> Do we need "rx_mode" ?
> Only "tx_mode" is enough if my understanding was correct.

=46or our (Asahi) purposes yes, we only require TX. However, TAS2770 also
has a bus keeper on SDIN, and I suspect other hardware may too. Rather than
break the API later on should the need to configure this arise,
I decided to add the capability now. I am happy to get rid of it if
we think it is superfluous at this time though.

> This patch-set adds new snd_soc_dai_set_tdm_idle(), but no one is calling
> it. Who use it ??

Currently no one in tree consumes this API, and it is likely that no one wi=
ll
until we submit our platform driver. See the linked resources in the cover
letter for more details.

In the interests of transparency, I don't expect to have the
platform driver ready for submission any time soon; it is a bit of a mess
and given that I did not write most of it I still need to wrap my head
around why certain decisions were made during its design. However, we
are 100% committed to getting it merged at some point.

If you would prefer I can resubmit this series along with the driver
once it is ready, so that there is an example consumer for the API.

Regards,

James Calligeros


